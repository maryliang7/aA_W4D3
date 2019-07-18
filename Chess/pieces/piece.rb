require "singleton"
class Piece
  attr_reader :pos, :color
  def initialize(pos, color, board)
    @color = color.to_sym
    @board = board
    @pos = pos
    
  end

  def symbol
    
  end

end
