module Players

  class Computer < Player
    def move(board)
      valid_moves = (1..9).to_a.collect{ |value| value.to_s }
      valid_moves.sample
    end
  end

end
