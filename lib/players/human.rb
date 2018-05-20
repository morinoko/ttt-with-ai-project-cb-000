module Players

  class Human < Player
    def move(board)
      puts "Player #{self.token}, where do you want to move? Enter 1 - 9"
      gets.strip
    end

  end
end
