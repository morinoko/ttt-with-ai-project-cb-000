module Players

  class Computer < Player
    POSSIBLE_MOVES = (1..9).to_a.collect { |position| position.to_s }
    CORNER_MOVES = ["1", "3", "7", "9"]

    def move(board)
      move = nil
      if !board.taken?( "5" )
        move = "5"
      else
        move = random_move(board)
      end
      move
    end

    def random_move(board)
      move = POSSIBLE_MOVES.sample
      while board.taken?( move )
        move = POSSIBLE_MOVES.sample
      end
      move
    end

    def corner_move(board)
      

  end

end
