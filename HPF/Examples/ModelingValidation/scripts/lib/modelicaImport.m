function [res, des] = modelicaImport(file, regex, varargin)
% res = modelicaImport(file) Parse an Modelica mat-file with
%   simulation results and retrun its content in a structure.
%
%   res = omRead(file, regex) only returns the fields that match the
%       regular expression
%   res = omRead(file, regex, 'variablesOnly') returns all time dependent
%       varialbes that match the regular expression.
%   res = omRead(file, regex, 'parametersOnly') returns all parameters
%       that match the regular expression.

    if nargin < 2
        regex = [];
    end
    
    parseDescription = nargout > 1;
    
    args = {'parametersOnly' 'variablesOnly'};
    foo = num2cell(ismember(args, varargin));
    [parametersOnly, variablesOnly] = deal(foo{:});

    foo = ismember(varargin, args);
    if ~all(foo)
        error('Unknown arguments!');
    end
        
    % Load dataInfo data_1 data_2 description name
    vars = {'name', 'dataInfo', 'data_1', 'data_2'};
    if parseDescription
        vars = [vars {'description'}];
    end
    load (file, vars{:});

    % Check if all variables have been loaded
    for var = vars'; var = var{1};
        if ~exist(var, 'var'); error('The mat file is corrupted.'); end
    end
    
    % name - a list of the names of all variables and parameters that
    %   modelica produced in the res-file.
    % dataInfo - same size as 'name'. Contains information whether the data
    %   for this entry is stored in data_1 or data_2
    % data_1 - contains the values of all parameters and variables that
    %   remain constant throughout the simulation run (Dymola only).
    % data_2 = contains the values of all variables for each timestep.
    % description - same size as 'name'. Contains the modelica description
    %   string
    
    % Convert to cell arrays
    name = cellstr(name');
    if parseDescription
        description = cellstr(description');
    end
    
    if parametersOnly 
        % Omit all variables
        idx = dataInfo(1,:) == 2;
        name(idx) = [];
        dataInfo(:,idx) = [];
        if parseDescription
            description(idx) = [];
        end
    end
    
    if variablesOnly
        % Omit all parameters
        idx = dataInfo(1,:) == 1;
        name(idx) = [];
        dataInfo(:,idx) = [];
        if parseDescription
            description(idx) = [];
        end
    end
    
    if ~isempty(regex)
        % Omit all elements that do not match the expression.
        idx = cellfun(@(x) isempty(regexp(x, regex, 'once')), name);
        name(idx) = [];
        dataInfo(:,idx) = [];
        if parseDescription
            description(idx) = [];
        end
    end
    
% Handle der(...) entries    
    derIdx = ~cellfun(@isempty, (strfind(name, 'der(')));
    % Change der(a.b) to a.der_b
    % Didn't work with Dymola, but since I didn't need these entries I 
    % didn't debug this issue. The der(...) entries are removed instead.
%     for i = find(derIdx(:))'
%         dotIdx = [0 strfind(name{i}(5:end-1), '.')];
%         name{i} = [name{i}(4+(1:dotIdx(end))) 'der_' name{i}(5+dotIdx(end):end-1)];
%     end
    name(derIdx) = [];
    dataInfo(:,derIdx) = [];
    if parseDescription
        description(derIdx) = [];
    end

    % Sort names so that the tree can be parsed efficiently
    [name, sortIdx] = sort(name);
    
    % Parse the tree
    if parseDescription
        [res, des] = assembleObject(1, 0, name, dataInfo(:,sortIdx), {data_1 data_2}, description(sortIdx));
    else
        res = assembleObject(1, 0, name, dataInfo(:,sortIdx), {data_1 data_2});
    end
%     res.startStopTime = data_1(1,:);
end


function [res, des, elementName, newRow] = extractElement(row, level, tree, dataInfo, data, varargin)
    % Extracts one element from the tree. The element might be simply data, 
    % an object or an array of these these two.
    
    if nargin > 5
        description = varargin{1};
    end
                

    [root, elementName, nLevels] = decompose(row, level, tree);
    
    % Check if the current line contains an array
    if strcmp(elementName(end), ']')
        % The current line contains an array
        
        % Determine the number of rows per element in this array
        nRows = 1;
        if level < nLevels
            while row + nRows < numel(tree) && ...
                    length(tree{row+nRows}) >= length([root elementName]) && ...
                    strcmp([root elementName], tree{row+nRows}(1:numel([root elementName])))
                nRows = nRows + 1;
            end
        end
        
        % Determine the number of dimensions of the array
        idx = strfind(elementName, '[');
        dim = str2idx(elementName(idx:end));
        
        elementName = elementName(1:idx-1);
        root = [root, elementName, '['];
        
        % Determine how many elements are in this array
        lastRow = row+nRows-1;
        while lastRow+nRows < numel(tree)
            if length(tree{lastRow+nRows}) > length(root) && ...
                    strcmp(root, tree{lastRow+nRows}(1:numel(root)))
                lastRow = lastRow + nRows;
                
                % Check dimensions
                idx = strfind(tree{lastRow}(numel(root)+1:end), ']');
                dim = max(dim, str2idx(tree{lastRow}(numel(root)+(0:idx))));
            else
                break
            end
        end
        
        % Check if it is an data or object array
        if nLevels == level
            % It is a data array
            dat = dataInfo(:, row:lastRow);
%             if ~all(dat(1,:)==dat(1,1)); error('foo'); end

            % Check whether the data has to be inverted
            m = ones(size(dat, 2));
            m( dat(2,:)<0 ) = -1;
            dat(2,:) = abs(dat(2,:));
            
            % If a parameter value will be read omit the second value.
            if any(dat(1,:) == 2)
                n=size(data{dat(1,1)},2);
            else
                n = 1;
            end
            
            % Allocate memory
            res = zeros([dim n]);
            
            % Read data
            for i=1:lastRow-row+1
                idx = getIndex(row+i-1, level, tree);
                if dat(1,i) == 1 && any(dat(1,:) == 2)
                    % If a variable is constant for the whole simulation
                    % Dymola stores its values in the data{1}. In this case
                    % the values are repeated to match the time scale.
                    foo = m(i)*data{dat(1,i)}(dat(2,i),:);
                    res(multDimIdx(size(res),idx)) = linspace(foo(1), foo(2), n);
                else
                    res(multDimIdx(size(res),idx)) = m(i)*data{dat(1,i)}(dat(2,i),1:n);
                end
            end
            if nargin > 5
                des = description{lastRow};
            else
                des = [];
            end
            newRow = lastRow+1;
        else
            % If it is an object array
            
            % Get list of fieldnames
            fn = cell(lastRow-row+1, 1);
            for i = 1:numel(fn)
                [~, element, ~] = decompose(row+i-1, level+1, tree);
                idx = strfind(element, '[');
                if isempty(idx)
                    fn{i} = element;
                else
                    fn{i} = element(1:idx-1);
                end
            end
            fn = unique(fn);
            
            % Allocate memory for the object array
            foo = [fn'; cell(1, numel(fn))];
            res(multDimIdx([dim 1], dim)) = struct(foo{:});
            if numel(dim) > 1
                res = reshape(res, dim);
            end
            
            % Copy all objects to the array
            newRow = row;
            while newRow <= lastRow
                idx = getIndex(newRow, level, tree);
                [tempRes, des, newRow] = assembleObject(newRow, level, tree, dataInfo, data, varargin{:});
                fnTemp = fieldnames(tempRes);
                if numel(fnTemp) == numel(fn)
                    res(multDimIdx([dim 1],idx)) = tempRes;
                else
                    % Some fields are missing. Copy the available ones.
                    for i = 1:numel(fnTemp)
                        res(multDimIdx([dim 1],idx)).(fnTemp{i}) = tempRes.(fnTemp{i});
                    end
                end
            end
        end % if nLevels == level
    else % if strcmp(elementName(end), ']')
        if nLevels == level
            % The row specifies data
            dat = dataInfo(:, row);
            
            if dat(1) == 0
                dat(1) = 2;
            end
            
            % Check wheter the data has to be inverted
            if dat(2) < 0
                m = -1;
                dat(2) = -dat(2);
            else
                m = 1;
            end
            
            % If a parameter value is read omit the second value
            if dat(1) == 1 && dat(2) > 1
                res = m*data{dat(1)}(dat(2),1);
            else
                res = m*data{dat(1)}(dat(2),:)';
            end
            if nargin > 5
                des = description{dat(1)};
            else
                des = [];
            end
            newRow = row + 1;
        else % if nLevels == level
            % The row specifies an object
            [res, des, newRow] = assembleObject(row, level, tree, dataInfo, data, varargin{:});
        end
    end % if strcmp(elementName(end), ']')
end % function

function [res, des, newRow] = assembleObject(row, level, tree, dataInfo, data, varargin)
    % Assembles all fields of an object and puts them into one structure.
    % If description is passed assembleObject also returns the
    % corresponding descriptions for each field.
    
    if level > 0
        [root, ~, ~] = decompose(row, level+1, tree);
    end
    
    res = struct();
    des = struct();
    
    i = row;
    while i <= numel(tree)
        % Check if this line belongs to the object
        if level == 0 || (length(root) < length(tree{i}) && strcmp(root, tree{i}(1:numel(root))))
            % Parse field
            [res_, des_, elementName, i] = extractElement(i, level+1, tree, dataInfo, data, varargin{:});
            % Add field to structure
            res.(elementName) = res_;
            if nargin > 5
                des.(elementName) = des_;
            end
        else
            break
        end
    end
    newRow = i;
end % function



function idx = str2idx(str)
    % Convert a string '[1,2]' to a numeric array [1 2]
    foo = strsplit(str(2:end-1), ',');
    idx = cellfun(@str2num, foo);
end

function idx = getIndex(row, level, tree)
    % Get the index of the array element at [row, level].
    [~, element, ~] = decompose(row, level, tree);
    
    foo = strfind(element, '[');
    idx = str2idx(element(foo:end));
end

function res = multDimIdx(dim, idx)
    % Returns the linear indices to access the whole last dimension of the
    % array at idx.
    % dim = size(array)
    % array(res) = array(idx(1), ..., idx(n), :)
    foo = cell(numel(dim),1);
    for j = 1:numel(idx)
        foo{j} = repmat(idx(j), dim(end), 1);
    end
    foo{end} = (1:dim(end))';
    res = sub2ind(dim, foo{:});
end

function [root, element, nLevels] = decompose(row, level, tree)
    % Decompose the tree row at the specified level.
    % given tree{row} = 'a.b.c.d.e'
    % ['a.b.', 'c', 5] = decompose(row, 3, tree)
    
    % Positions of dots with virtual dots at the beginning and end of the
    % line.
    dotIdx = [0 strfind(tree{row}, '.') length(tree{row})+1];
    
    root = tree{row}(1:dotIdx(level));
    element = tree{row}(dotIdx(level)+1:dotIdx(level+1)-1);
    nLevels = numel(dotIdx) -1;
end
