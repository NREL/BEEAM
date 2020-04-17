within HPF.Utilities;

function interpolateBilinear
  extends Modelica.Icons.Function;
  /*
        Using a MATLAB/Octave style syntax.
        zq = interpolateBilinear(X, Y, Z, xq, yq)
        zq : output 
        xq, yq : query points 
        X, Y, Z : Input data in meshgrid format 
      */
  input Real X[:, :] "X axis input meshgrid data";
  input Real Y[:, :] "Y axis input meshgrid data";
  input Real Z[:, :] "Z axis input meshgrid data";
  input Real x_q "query value @x";
  input Real y_q "query value @y";
  output Real z_q "Interpolated value";
  // get input dimensions
protected
  final parameter Integer dim_X = size(X, 2);
  final parameter Integer dim_Y = size(Y, 1);
  // values evaluated at the selected grid
  Real f_xi_yi "f(x_i, y_i)";
  Real f_xin_yi "f(x_i+1, y_i)";
  Real f_xi_yin "f(x_i, y_i+1)";
  Real f_xin_yin "f(x_i+1, y_i+1)";
  // indices
  Integer i "index for y";
  Integer j "index for x";
  Integer iLast = 1 "Index used in last search";
  Real x1;
  Real x2;
  Real y1;
  Real y2;
algorithm
// search X | search in 2nd dim --------------
  i := min(max(iLast, 1), dim_X - 1);
  if x_q >= X[1, i] then
    while i < dim_X and x_q >= X[1, i] loop
      i := i + 1;
    end while;
    i := i - 1;
  else
    while i > 1 and x_q < X[1, i] loop
      i := i - 1;
    end while;
  end if;
// search forward
// search backward
// search y | search in 1st dim --------------
  j := min(max(iLast, 1), dim_Y - 1);
  if y_q >= Y[j, 1] then
    while j < dim_Y and y_q >= Y[j, 1] loop
      j := j + 1;
    end while;
    j := j - 1;
  else
    while j > 1 and y_q < Y[j, 1] loop
      j := j - 1;
    end while;
  end if;
// search forward
// search backward
/*
      NOTE !! :
      i is the index for y direction
      j is the index for x direction
    */
// Get interpolation data
  f_xi_yi := Z[j, i];
  f_xin_yi := Z[j, i + 1];
  f_xi_yin := Z[j + 1, i];
  f_xin_yin := Z[j + 1, i + 1];
/* perform interpolation
      Interpolating in x direction.
      Then interpolating in y direction.
      Source: Wikipedia, https://en.wikipedia.org/wiki/Bilinear_interpolation
    */
  x1 := X[j, i];
  x2 := X[j, i + 1];
  y1 := Y[j, i];
  y2 := Y[j + 1, i];
  z_q := (f_xi_yi * (x2 - x_q) * (y2 - y_q) + f_xin_yi * (x_q - x1) * (y2 - y_q) + f_xi_yin * (x2 - x_q) * (y_q - y1) + f_xin_yin * (x_q - x1) * (y_q - y1)) / ((x2 - x1) * (y2 - y1));
  annotation(
    Documentation(info = "<html><head></head><body>Perform 2D interpolation.<div><br></div><div>Ouput is a single interpolated point corresponding to the x and y query values.</div><div><br></div><div>Input data is in MATLAB/Octave meshgrid format.</div></body></html>"));
end interpolateBilinear;