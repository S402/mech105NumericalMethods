function I = Simpson(x,y)
% Simpson_LastName: Solve a simpson 1/3 rule
% Inputs
%   x =
%   y = 
%
% Outputs
%   I = approximate integral

% Checks if 2 input arguments were entered
if nargin < 2
    error('Two arrays needed!')
end

% Checks if input arrays are the same length
if size(x) ~= size(y)
    error('Input arrays need to be the same length!')
end

% Checks if there is an even or odd number of intervals
intervals = size(x,2)-1;

if mod(intervals,2) == 0 %checks if there are an even or odd # of intervals
    disp('Even amount of intervals')
else    % displays a warning that the trapezoidal will be used when there is an even amount of intervals
    disp('WARNING: Odd amount of intervals - Trapezoidal rule will be used for last interval calculation!')
end

% checks the size of the first interval
intx = diff(x);

% Checks if the intervals are evenly spaced across x-axis
if intx(1) ~= intx(1,:)
    error('Unequally spaced interval on x-axis')
end

l = length(x);
a = min(x); % Initializes the lower bound from x vars to a
b = max(x); % Initializes the upper bound from y vars to b
x2 = 0; % Initializes variables to zero for loops
x1 = 0;
x3 = 0;
x4 = 0;
 
% Adds together the total values for odd segments
for Sum = 1:2:(l-1)
    x1 = (y(:,Sum)) + 2;
    x2 = x1 + x2;
end
 
% Adds the total values for even segments
for i = 2:2:(l-2)
    x3 = (y(:,i));
    x4 =  x3 + x4;
end
 
% Trapezoidal rule calculation
trapezoid = ((x(1,length(x)))- (x(1,length(x)-1)))*((y(1,length(x)-1)+(y(1,length(y)))))/2;
 
% When there are an odd amount of intervals, Simpson's rule is used
if mod(intervals,2) == 1
    I = (b-a).*((y(1,1)) + 4.*(x2) + 2.*(x4) + y(1,(l)))/(3.*l);
% When there are an even amount, both Simpson's rule and the Trapezoidal rule are used
else
    I = ((b-a).*((y(1,1)) + 4.*(x2) + ((x4/2)) + y(1,(l)))/(3.*(length(x)))) + trapezoid;
end
 
% Displays the calculated integral stored under the variable I
I

end