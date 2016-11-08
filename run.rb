require_relative "lib/toy_robot/command"

puts "WELCOME TO MY ROBOT SIMULATOR VERSION 1.0"
puts "Issue a command to the robot or type in 'HELP' for instructions."

input = ""

while input != "EXIT" do
  print ">> "
  input = gets.chomp
  puts ToyRobot::Command.command(input)
  puts "Type another command."
end
