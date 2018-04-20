# False Position Algorithm
## This algorithm is a **MATLAB** function that uses the False Position method to estimate the root of a function.
### Inputs:
* **func** Function user wants to find the root of.
* **xl** Lower bound guess to bracket root.
* **xu** Upper bound guess to bracket root.
* **es** The relative error the user wants the function result in (will defualt to 0.00001%).
* **maxiter** The number of iterations the user wants the function to run for.
### Outputs:
* **root** The estimated location of the root.
* **fx** The value of the function evaluated at the estimated root.
* **ea** The approximate relative percent error.
* and **iter** the number of iterations taken.
