require_relative "pieces"
require_relative "display"

class Board
  attr_reader :rows, :sentinel, :piece
  def initialize()
    
    #@rook = Rook.new
    @sentinel = NullPiece.instance
    @rows = Array.new(8) {Array.new(8, @sentinel)}
    @piece = Piece.new([1,3], "Black", self)
    back_pieces
  end

  def [](pos)
    row, col = pos
    @rows[row][col]
  end

  def []=(pos, val)
    row, col = pos
    @rows[row][col] = val
  end

  def move_piece(start_pos, end_pos)
    raise "No piece here" if self[start_pos] == @sentinel
    raise "Not a valid position" if !valid_pos?(end_pos)
    self[end_pos] = self[start_pos]
    self[start_pos] = @sentinel

  end

  def valid_pos?(pos)
    pos.all? { |ele| ele >= 0 && ele <= 7 }
  end

  def back_pieces
    back_pieces_arr = [
      Rook, 
      Knight,
      Bishop,
      Queen,
      King,
      Bishop,
      Knight,
      Rook
    ]
    [0,7].each do |rows|
      (0...@rows.length).each do |i|
        if rows == 0
          @rows[rows][i] = back_pieces_arr[i].new([rows, i], "Black", self)
        else
          @rows[rows][i] = back_pieces_arr[i].new([rows, i], "White", self)
        end
      end
    end 
  end
end
