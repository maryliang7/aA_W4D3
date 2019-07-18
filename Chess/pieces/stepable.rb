
module Stepable
  def moves
    directions = move_diffs
    directions.map! do |diff_pos|
      diff_pos[0] = diff_pos[0] + @pos[0]
      diff_pos[1] = diff_pos[1] + @pos[1]
      diff_pos
    end
    directions.select do |pos| 
      @board[pos].color != self.color &&
      ((pos[0] >= 0 && pos[0] < 8) && (pos[1] >= 0 && pos[1] < 8))
    end
  end
end