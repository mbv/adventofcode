require_relative 'map'
require_relative 'path'

class Solution


  def solution
    Map.new(Path.new).run
  end
end


Solution.new.solution