module Players

  class Computer < Player
    POSSIBLE_MOVES = [ "1", "2", "3", "4", "5", "6", "7", "8", "9" ]
    CORNER_MOVES = [ "1", "3", "7", "9" ]

    def move( board )
      move = nil
      if !board.taken?( "5" )
        move = "5"
      elsif ready_to_win?( board )
        block
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

    def ready_to_win?( board )
      Game::WIN_COMBINATIONS.detect do |win_combo|
        if win_combo.select { |index| board.position( index + 1 ) == token }.size == 2 &&
           win_combo.any? { |index| board.position( index + 1 ) == " " }
           move = win_combo.select { |index| !board.taken?( index + 1 ) }
           move = (move.to_i + 1).to_s
        end

        # ( board_combo[ 0 ] == opponent && board_combo[ 1 ] == opponent && board_combo[ 3 ] == " " ) ||
        # ( board_combo[ 0 ] == opponent && board_combo[ 1 ] == " " && board_combo[ 3 ] == opponent ) ||
        # ( board_combo[ 0 ] == " " && board_combo[ 1 ] == opponent && board_combo[ 3 ] == opponent )
    end

    def block( board )
      row_to_block = ready_to_win? (board)
      position_to_block = row_to_block.detect { |position| position != opponent }
      move = (position_to_block + 1).to_s
    end

    def opponent
      self.token == "X" ? "O" : "X"
    end

  end
end
