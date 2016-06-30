require 'toy_robot/errors'
require 'toy_robot/execution_hooks'

module ToyRobot
  class Simulator
    extend ExecutionHooks

    MAX_X = 5
    MAX_Y = 5
    VALID_FACINGS = [:north, :south, :east, :west]

    attr_reader :current_facing, :current_position

    before_invoke :check_if_first_command, only: [:move, :left, :right, :report]

    def initialize
      @first_move = true
      @current_position = { x: 0, y: 0 }
    end

    def place(x,y,facing)
      set_position(x,y)  
      set_facing(facing)
      set_first_move! if @first_move
    end

    def move
      case @current_facing
      when :north
        y = @current_position[:y] + 1
        set_position(@current_position[:x], y)
      when :south
        y = @current_position[:y] - 1
        set_position(@current_position[:x], y)
      when :east
        x = @current_position[:x] + 1
        set_position(x, @current_position[:y])
      when :west
        x = @current_position[:x] - 1
        set_position(x, @current_position[:y])
      end
    end

    def left
      case @current_facing
      when :north
        set_facing(:west)
      when :south
        set_facing(:east)
      when :east
        set_facing(:north)
      when :west
        set_facing(:south)
      end
    end

    def right
      case @current_facing
      when :north
        set_facing(:east)
      when :south
        set_facing(:west)
      when :east
        set_facing(:south)
      when :west
        set_facing(:north)
      end
    end

    def report
      position = @current_position.values.join(",")
      "#{position},#{@current_facing.to_s.upcase}"
    end

    private

    def check_if_first_command
      fail InvalidCommandError if @first_move
    end

    def set_first_move!
      @first_move = false
    end

    def set_facing(facing)
      facing = facing.to_sym
      if VALID_FACINGS.include?(facing)
        @current_facing = facing
      else
        fail ToyRobot::InvalidFacingError
      end
    end

    def set_position(x,y)
      x = x.to_i
      y = y.to_i

      if valid_position?(x,y)
        @current_position[:x], @current_position[:y] = x, y
      else
        fail ToyRobot::InvalidPositionError
      end
    end

    def valid_position?(x,y)
      x.between?(0, MAX_X) && y.between?(0, MAX_Y)
    end
  end
end
