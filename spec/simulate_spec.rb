require 'rspec'
require_relative '../lib/toy_robot/simulator'

RSpec.describe 'Simulate Robot' do
  describe 'Example A' do
    it 'should print correct output' do
      simulator = ToyRobot::Simulator.new
      simulator.place(0,0, :north)
      simulator.move
      expect(simulator.report).to eq '0,1,NORTH'
    end
  end
end
