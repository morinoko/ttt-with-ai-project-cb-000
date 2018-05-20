module Players

  class Computer < Player
    VALID_MOVES = (1..9).to_a.collect { |position| position.to_s }
    
    def move(board)
      
    end

    def random_move
      move = valid_moves.sample
      while board.taken?( move )
        move = valid_moves.sample
      end
      move
    end
  end

end
