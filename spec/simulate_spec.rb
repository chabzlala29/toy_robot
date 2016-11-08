require 'rspec'
require 'toy_robot/simulator'

RSpec.describe 'Simulate Robot' do
  describe 'Example A' do
    it 'should print correct output' do
      simulator = ToyRobot::Simulator.new
      simulator.place(0,0, "NORTH")
      simulator.move
      expect(simulator.report).to eq '0,1,NORTH'
    end
  end

  describe 'Example B' do
    it 'should print correct output' do
      simulator = ToyRobot::Simulator.new
      simulator.place(0,0, "NORTH")
      simulator.left
      expect(simulator.report).to eq '0,0,WEST'
    end
  end

  describe 'Example C' do
    it 'should print correct output' do
      simulator = ToyRobot::Simulator.new
      simulator.place(1,2, "EAST")
      simulator.move
      simulator.move
      simulator.left
      simulator.move
      expect(simulator.report).to eq '3,3,NORTH'
    end
  end

  describe 'Errors' do
    it 'out of the table when placed' do
      simulator = ToyRobot::Simulator.new
      expect{ simulator.place(6,0, "NORTH") }.to raise_error ToyRobot::InvalidPositionError
    end

    it 'invoke invalid command on first command' do
      simulator = ToyRobot::Simulator.new
      expect{ simulator.move }.to raise_error ToyRobot::InvalidCommandError
    end

    it 'when input invalid facing' do
      simulator = ToyRobot::Simulator.new
      expect{ simulator.place(0,0, "WRONGFACING") }.to raise_error ToyRobot::InvalidFacingError
    end
  end
end
