function [root,fx,ea,iter] = falsePosition(func,xl,xu,es,maxiter)
% The function falsePosition uses the False Position method to estimate the root of a
% function
% 
% Inputs:
%   func = the function being evaluated
%   xl = the lower guess
%   xu = the upper guess
%   es = the desired relative error (should default to 0.0001%)
%   maxiter - the number of iterations desired (should default to 200)
%
% Outputs:
%   root - the estimated root location
%   fx - the function evaluated at the root location
%   ea - the approximate relative error (%)
%   iter - how many iterations were performed

%% Check user inputs
format long;
if (nargin < 3)     %user must input at least 3 arguments
   error("Too few input arguements!")
elseif (nargin < 4)     %defaults max # of iterations and desired error
    maxiter = 200;
    es = 0.0001;
elseif (nargin < 5)
    maxiter = 200;
elseif (nargin > 5)     %if user inserts 5+ arguments, code will error
    error("Too many input arguments!")
else
end

%% Sign Test
%Tests to see if a root is possible for the bounds inputed by user
signTest = func(xl) * func(xu);     
if signTest > 0
    error("Try different lower and upper brackets.")
elseif signTest == 0
    disp("At least one of the brackets is a root.")
else
end

%% Calculating Root
iter = 0;   %initializes # of iterations to zero
oldRoot = 0;    %initializes oldRoot to zero for first iteration
while iter <= maxiter
    root = (xu) - ( ( func(xu) * (xl-xu) ) / ( func(xl) - func(xu) ) );
    fx = func(root);
    iter = iter + 1;
    
    if root ~= 0
       ea = abs(( (root - oldRoot) / root) * 100);
       oldRoot = root;    %sets root equal to oldroot for error calculation
    end 
    
    if func(root)*func(xl) < 0
        xu = root;
    elseif func(root)*func(xu) < 0
        xl = root;
    else
        ea = 0;
    end
    
    if ea < es || iter >= maxiter   % checks if # of iterations exceeds max 
           % iterations inputed by user or if percent error is smaller than
           % desired error
       break;
    end

end
    y = func(root);
    fprintf('Root is @ f(%.6f)\n', root)
    fprintf('f(%f) =', root)
    fprintf(' %f\n', y)
    fprintf('Number of iterations : %.0f\n', iter)
    fprintf('Percent error: %f\n', ea)
end