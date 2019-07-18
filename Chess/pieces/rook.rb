require_relative "slideable"
require_relative "piece"

class Rook < Piece
  include Slideable

  def move_dirs
    directions = horizontal_dirs
  end

  def symbol
    #@color
  end
end

