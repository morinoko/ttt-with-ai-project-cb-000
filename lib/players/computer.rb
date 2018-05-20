module Players

  class Computer < Player
    POSSIBLE_MOVES = [ "1", "2", "3", "4", "5", "6", "7", "8", "9" ]
    CORNER_MOVES = [ "1", "3", "7", "9" ]

    def move( board )
      move = nil
      if !board.taken?( "5" )
        move = "5"
      elsif CORNER_MOVES.any? { |corner| !board.taken?( corner ) }
        move = corner_move( board )
      else
        move = random_move( board )
      end
      move
    end

    def random_move( board )
      move = POSSIBLE_MOVES.sample
      while board.taken?( move )
        move = POSSIBLE_MOVES.sample
      end
      move
    end

    def corner_move( board )
      move = CORNER_MOVES.sample
      while board.taken?( move )
        move = CORNER_MOVES.sample
      end
      move
    end

    def opponent
      self.token == "X" ? "O" : "X"
    end

  end
end
