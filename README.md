# Toy Simulator
A simple gem to simulate a robot moving on a table

## Usage

This is how you command a robot

```
  require 'toy_simulator/simulator'

  simulator = ToySimulator::Simulator.new
  simulator.place(0,0,:north)
  simulator.move
  simulator.report

  # it will print a report like this:
  # Output: 0,1,NORTH
```
