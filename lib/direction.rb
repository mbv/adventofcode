class DirectionCoefficient < Struct.new(:axis, :value)
end

class Direction
  def self.go_left
    throw NotImplementedError
  end

  def self.go_right
    throw NotImplementedError
  end

  def self.coefficient
    throw NotImplementedError
  end
end

class North < Direction
  def self.go_left
    West
  end

  def self.go_right
    East
  end

  def self.coefficient
    @@coefficient ||= DirectionCoefficient.new(:x, 1).freeze
  end
end

class West < Direction
  def self.go_left
    South
  end

  def self.go_right
    North
  end

  def self.coefficient
    @@coefficient ||= DirectionCoefficient.new(:y, -1).freeze
  end
end

class South < Direction
  def self.go_left
    East
  end

  def self.go_right
    West
  end

  def self.coefficient
    @@coefficient ||= DirectionCoefficient.new(:x, -1).freeze
  end
end

class East < Direction
  def self.go_left
    North
  end

  def self.go_right
    South
  end

  def self.coefficient
    @@coefficient ||= DirectionCoefficient.new(:y, 1).freeze
  end
end
