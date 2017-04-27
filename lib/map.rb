require_relative 'coordinate'
require_relative 'direction'
require_relative 'path'

class Map
  attr_accessor :coordinate, :direction

  attr_reader :distance

  def initialize(path = Path.new)
    @path = path
    @coordinate = Coordinate.new(0, 0)
    @direction = North
  end

  def run
    @path.moves.each do |move|
      go move
    end
  end

  def distance
    @coordinate.distance Coordinate.new(0, 0)
  end

  def go(move)
    @direction = @direction.send(move.turn)
    @coordinate.change(@direction.coefficient.axis,
                       @direction.coefficient.value * move.distance)
  end
end