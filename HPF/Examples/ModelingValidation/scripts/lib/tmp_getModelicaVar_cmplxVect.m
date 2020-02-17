
% temporary fix
% returns a 2-d array for a complex modelica vector
function res = getModelicaVar(fileName, varName)

    % read Modelica mat file

    % transpose matrices
    % Matrices in the mat file:
    %
    % * name
    % * description
    % * dataInfo
    % * data_1
    % * data_2


    % Load dataInfo data_1 data_2 name
    vars = {'name', 'dataInfo', 'data_1', 'data_2'};
    load (fileName, vars{:});

    % Convert to cell arrays
    name = cellstr(name');

    % search through the variable tree.
    % Locate the variable and return.
    res = getVar(varName, name, dataInfo, data_1, data_2);


end

function y = getVar(varName, name, dataInfo, data_1, data_2)
    % tmp fix...
    % This is gonna be real slow.. 
    % Create a variable name with the bracket
    y = struct();
    vectIdx = 1; % modelica vector index
    indices = 1;
    while indices ~= -1
        % real part
        varNameTmp = [varName, '[', num2str(vectIdx), '].re'];
        indices = getVarIndx(varNameTmp, name);
        if indices(1) == -1
           break; 
        end
        y(vectIdx).re = getVarValue(indices(1), dataInfo, data_1, data_2);
        % imaginary part
        varNameTmp = [varName, '[', num2str(vectIdx), '].im'];
        indices = getVarIndx(varNameTmp, name);
        y(vectIdx).im = getVarValue(indices(1), dataInfo, data_1, data_2);
        
        vectIdx = vectIdx + 1;
    end
    % vector, variable name contains square brackets
    
    %getVector
    
end

% Returns indices of all the variables with the name as the argument
% iterate through the name cell array and search for the varaibles matching the 
% string.
function y = getVarIndx(varName, name)
    idx = 1;
    for k = 1:1:length(name) 
        if strncmp(varName, name{k}, length(varName)) == 1
            y(idx, 1) = k;
            idx = idx + 1;
        end
    end
    % if the search results in no match
    if idx == 1
       y = -1; 
    end
end


% Return value for the variable in data_1 and data_2
function y = getVarValue(indx, dataInfo, data_1, data_2)
    dataInfoVal = dataInfo(:, indx);
    % this would return a column vector
    % Element 1: data contained in 1 = data_1, 2 = data_2, 0 = time variable 
    % Element 2: index of the data in data_1 or data_2
    % Element 4: ignore
    % Element 5: ignore
    if dataInfoVal(1, 1) == 1
        y = data_1(dataInfoVal(2, 1));
    elseif dataInfoVal(1, 1) == 2
        y = data_2(dataInfoVal(2, 1), :);
    else 
       % error
       return;  
    end
end



















