class Game
  attr_accessor :player_1, :player_2, :board

  WIN_COMBINATIONS = [
    [0,1,2], # Top row
    [3,4,5], # Middle row
    [6,7,8], # Bottom row
    [0,3,6], # Left column
    [1,4,7], # Middle column
    [2,5,8], # Right column
    [6,4,2], # Diagonal left bottom to right Top
    [0,4,8]  # Diagonal left top to right bottom
  ]

  def initialize( player_1 = Players::Human.new( "X" ), player_2 = Players::Human.new( "O" ), board = Board.new )
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    @board.turn_count.even? ? @player_1 : @player_2
  end

  def win_combos 
    WIN_COMBINATIONS
  end

  # Checks if there is a winner by testing whether board positions
  # for each possible winning combination are filled with one player's moves
  def won?
    WIN_COMBINATIONS.detect do |win_combo|
      # The specific cell indexes for a given win combination
      win_index_1 = win_combo[0]
      win_index_2 = win_combo[1]
      win_index_3 = win_combo[2]

      game_board_combination = [
        @board.cells[ win_index_1 ],
        @board.cells[ win_index_2 ],
        @board.cells[ win_index_3 ]
      ]

      winning_combo?( game_board_combination )
    end
  end

  def draw?
    @board.full? && !won?
  end

  def over?
    @board.full? || won? || draw?
  end

  def winner
    if won?
      winning_combo = won?
        @board.cells[ winning_combo.first ]
    end
  end

  def turn
    player = current_player
    player_move = player.move(@board)

    if !@board.valid_move?( player_move )
      turn
    else
      @board.valid_move?( player_move )
      puts "Turn #{@board.turn_count + 1}:"
      @board.display
      @board.update( player_move, player )
      puts "\nPlayer #{player.token} moved to position #{player_move}"
      @board.display
      puts "\n\n"
      player = current_player
    end
  end

  def choose_players
    puts "How many players do you want to play with? 0, 1, or 2?"
    num_players = ""

    until num_players =~ /[012]/
      puts "Please enter only 0, 1, or 2"
      num_players = gets.strip
    end

    case num_players
      when "0"
        @player_1 = Players::Computer.new( "X" )
        @player_2 = Players::Computer.new( "O" )
      when "1"
        @player_1 = Players::Human.new( "X" )
        @player_2 = Players::Computer.new( "O" )
      else
        self
    end
  end

  def play
    while !over?
      turn
    end

    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end

  def start
    choose_players
    play
  end

  private

  def winning_combo?( combination )
    combination.all? { |position| position == @player_1.token } ||
    combination.all? { |position| position == @player_2.token }
  end

end
