require_relative 'coordinate'
require_relative 'direction'

class Map
  attr_accessor :coordinate, :direction

  def initialize(path)
    @path = path
    @coordinate = Coordinate.new(0, 0)
    @direction = North
  end

  def run
    @path.moves.each do |move|
      go move
    end
    puts @coordinate.distance Coordinate.new(0, 0)
  end

  def go(move)
    @direction = @direction.send(move.turn)
    @coordinate.change(@direction.coefficient.axis, @direction.coefficient.value, move.distance)
  end
end