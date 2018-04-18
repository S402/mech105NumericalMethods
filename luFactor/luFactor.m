function [L, U, P] = luFactor(A)
% luFactor
% This function preforms LU factorization after pivoting a given 
% coefficient matrix [A] in order to find [L], [U], and [P] matricies 
%
% Input:
%   [A] = coefficient matrix
%
% Output:
%   [L] = Lower Triangular Matrix
%   [U] = Upper Triangular Matrix
%   [P] = Pivot Matrix
%
% Instructions:
%   Enter a sqaure matrix, [A], of coefficients to solve 

if nargin > 1
    error('Too many inputs, only a single sqaure matrix is needed!')
elseif nargin < 1
    error('Must insert a sqaure matrix!')
end

[r,mult_fact]=size(A);
if r~=mult_fact     %checks if matrix is square
    error('Matrix is not a square!')
end

d = length(A); %Sets the length of matrix [A] equalt to a variable d
U = A;      %Sets [U] equal to [A] for elimination step
L = eye(d); %Creates an Identity matrix of 'd' dimensions and initializes [L] to it
P = eye(d); %Creates an Identity matrix of 'd' dimensions and initializes [P] to it
for i = 1:d %This sets 'i' equal to an array that goes from 1 to 'd'
    [~,mx] = max(abs(U(i:d,i))); %This scans through the [U] matrix and  
    %finds the maximum magnitude in the matrix
    mx = mx+(i-1); %This sets 'max' equal to the the row that is being operated on
    
    temp = P(:,1); %This rearranges the [P] matrix by moving the columns 
    P(1,:) = P(i,:); %around and setting temporary arrays
    P(i,:) = temp;
    
    
    temp = L(i,1:i-1); %This does the same to the [L] matrix so that it follows the pivoting
    L(i,1:i-1) = L(mx,1:i-1);
    L(mx,1:i-1) = temp;
    
    temp = U(i,i:end); %Finally, this does the same as the previous 2 and rearranges the [U] matrix
    U(i,i:end) = U(mx,i:end);
    U(mx,i:end) = temp;

    
    L(i,i) = 1; %This sets the matrix value at the coordinate (i,i) equal to 1
    for vec = (1+i):size(U,1) %'vec' then sets up a vector for value inputs
       mult_fact = U(vec,i)/U(i,i); %Calculates what the vector is multiplied by
       % to produce a coefficent of zero
       U(vec,i:d) = U(vec,i:d)-U(i,i:d)*mult_fact; %This does the multiplication and 
       %subtraction for the Gauss elimination 
       L(vec,i) = mult_fact; %Take [L] matrix and inputs the 'mult_fact' value in that coordinate
    end
end
disp('[P]')   %Couldn't figure out how to properly use fprintf for all the 
disp(P)     %different matrices so just used the disp function a bunch
disp('[U]')
disp(U)
disp('[L]')
disp(L)
end
