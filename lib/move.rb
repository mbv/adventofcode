class Move
  TURN_DIRECTIONS = {
      'L' => :go_left,
      'R' => :go_right
  }.freeze

  attr_reader :turn, :distance

  def initialize(raw)
    @turn = TURN_DIRECTIONS[raw.chars.first]
    @distance = raw[1..-1].to_i
  end
end