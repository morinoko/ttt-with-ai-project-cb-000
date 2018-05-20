module Players

  class Computer < Player
    POSSIBLE_MOVES = (1..9).to_a.collect { |position| position.to_s }

    def move(board)
      
      random_move(board)
    end

    def random_move(board)
      move = POSSIBLE_MOVES.sample
      while board.taken?( move )
        move = POSSIBLE_MOVES.sample
      end
      move
    end

  end

end
