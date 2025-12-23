# Numerical Approximation Course Project

This repository contains MATLAB programs developed for the Numerical Approximation
course project. The codes implement several fundamental numerical methods related to
**Runge Phenomenon**, **Interpolation**, **Data Fitting**, and **Root Finding**, aiming to illustrate 
their principles and approximation characteristics.

## Files

- `Runge.m`  
  Demonstrates **Runge Phenomenon** on a specific function.
  The code illustrates the Runge phenomenon by interpolating with equally spaced nodes
  and plotting the resulting oscillations, which is useful for understanding interpolation errors.

- `Spline.m`  
  Implements **Natural Cubic Spline Interpolation**.
  The program constructs piecewise cubic polynomials with continuous first and second derivatives,
  and plots the spline curve, providing a smooth interpolation of given data points.

- `Fitting.m`  
  Performs **Data Fitting** using polynomial approximation.
  Given a set of discrete data points, the program computes the fitting polynomial
  and visualizes the approximation result, helping analyze trends in data.

- `Bisection.m`  
  Implements the **Bisection Method** to find the root of a nonlinear equation.
  The program iteratively narrows the interval based on function sign changes
  until the desired accuracy is achieved. It is suitable for continuous functions
  with known bracketing intervals.