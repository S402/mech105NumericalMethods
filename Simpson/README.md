# Simpson's 1/3 Rule Algorithm
###### This algorithm is a **MATLAB** function that takes two arrays that represent (x, y) points and uses Simpson's 1/3 Rule to approximate the integral of the points. Since Simpson's 1/3 Rule works best for even intervals between points, if the user inputs an odd number of intervals then the function will utilize the trapezoidal rule for the rest of the points.
### Inputs:
**[x]** is an array of equally spaced x-values

**[y]** is an array of y-values corresponding to the array of x-values.
### Outputs:
* **I** returns the approximate integral of the points supplied by the x and y arrays.
