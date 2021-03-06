class Coordinate < Struct.new(:x, :y)
  def initialize(x = 0, y = 0)
    self.x = x
    self.y = y
  end

  def change(axis, value)
    send("#{axis}=", send(axis).send(:+, value))
    self
  end

  def distance(coordinate)
    (coordinate.x - x).abs + (coordinate.y - y).abs
  end

end