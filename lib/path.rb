require_relative 'move'

class Path
  PATH_TO_FILE = File.expand_path('../../map.txt', __FILE__)

  attr_reader :moves

  def initialize(path = PATH_TO_FILE)
    raw = File.open(path, 'r').readline.split ', '
    @moves = raw.map do |raw_move|
      Move.new(raw_move)
    end
  end
end