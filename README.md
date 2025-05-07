# 2dheatequation
2D Heat Equation Simulation in MATLAB

This project numerically simulates heat diffusion on a square metal plate using the 2D heat equation. It solves the equation using a finite difference method (explicit Euler in time) and visualizes the temperature spread from a localized heat source.

##  Features

- Solves the 2D heat equation:
  \[
  \frac{\partial u}{\partial t} = \alpha \left( \frac{\partial^2 u}{\partial x^2} + \frac{\partial^2 u}{\partial y^2} \right)
  \]
- Visualizes heat diffusion as a dynamic surface plot or heatmap.
- Optional video export of the simulation (`output_video.avi`).

##  Requirements

- MATLAB R2018 or later (tested on R2023a)
- No external toolboxes required

##  Running the Simulation

Just run:

```matlab
heat_simulation_2d
