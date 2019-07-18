module Slideable
  attr_reader :HORIZONTAL_DIRS, :DIAGONAL_DIRS
  HORIZONTAL_DIRS = [[1,0], [0,1], [-1, 0], [0,-1]]
  DIAGONAL_DIRS = [[1,1], [-1,-1], [1,-1], [-1,1]]
  def horizontal_dirs
    HORIZONTAL_DIRS
  end

  def diagonal_dirs
    DIAGONAL_DIRS
  end

  def moves
    directions = move_dirs
    p "directions: #{directions}"
    pos_moves = []
    directions.each do |position|
      p "position[0]: #{position[0]}"
      p "position[1]: #{position[1]}"
      pos_moves += grow_unblocked_moves_in_dir(position[0], position[1])
    end
    p "pos_moves: #{pos_moves}"
    pos_moves
  end


  def grow_unblocked_moves_in_dir(dx, dy)
    # take into account the colors 
    pos_array = []
    new_pos = [@pos[0], @pos[1]]
    p "new_pos: #{new_pos}"
    until @board[new_pos] != NullPiece
      p "new_pos: #{new_pos}"
      pos_array << [new_pos[0]+dx, new_pos[1]+dy]
      new_pos = [new_pos[0]+dx, new_pos[1]+dy]
      p "new_pos: #{new_pos}"
    end
    p "self color: #{self.color}"
    p "piece color: #{@board[new_pos].color}"
    p "piece #{@board[new_pos]}"
    if @board[new_pos].color != self.color
      pos_array << [new_pos[0]+dx, new_pos[1]+dy]
    end

    p pos_array

  end

end
