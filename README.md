# Toy Robot
A simple gem to simulate a robot moving on a table

## Usage

This is how you command a robot

```
  require 'toy_robot/simulator'

  simulator = ToyRobot::Simulator.new
  simulator.place(0,0,:north)
  simulator.move
  simulator.report

  # it will print a report like this:
  # Output: 0,1,NORTH
```
