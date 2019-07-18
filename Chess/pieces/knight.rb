require_relative "stepable"
require_relative "piece"

class Knight < Piece
  include Stepable
  def move_diffs
    directions = [[2, 1], [1, 2], [2, -1], [-2, 1], [1, -2], [-2, -1], [-1, 2], [-1, -2]]
  end
end

