module Players

  class Computer < Player
    def move(board)
      valid_moves = (1..9).to_a.collect { |position| position.to_s }
      # available_moves = valid_moves.collect { |move| !board.taken?( move ) }
      # move = available_moves.sample
      move = valid_moves.sample
      while board.taken?( move )
        move = valid_moves.sample
      end
      move
    end
  end

end
