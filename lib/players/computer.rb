module Players

  class Computer < Player
    VALID_MOVES = (1..9).to_a.collect { |position| position.to_s }

    def move(board)
      random_move
    end

    def random_move(board)
      move = VALID_MOVES.sample
      while board.taken?( move )
        move = VALID_MOVES.sample
      end
      move
    end
  end

end
