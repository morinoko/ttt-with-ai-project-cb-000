class Board
  attr_accessor :cells

  def initialize
    reset!
  end

  def reset!
    @cells = Array.new(9, " ")
  end

  def display
    puts " #{@cells[ 0 ]} | #{@cells[ 1 ]} | #{@cells[ 2 ]} "
    puts "-----------"
    puts " #{@cells[ 3 ]} | #{@cells[ 4 ]} | #{@cells[ 5 ]} "
    puts "-----------"
    puts " #{@cells[ 6 ]} | #{@cells[ 7 ]} | #{@cells[ 8 ]} "
  end

  def position( player_input )
    index = input_to_index( player_input )
    @cells[ index ]
  end

  def full?
    @cells.all? { |cell| cell =~ /[XO]/ }
  end

  def turn_count
    @cells.count{ |cell| cell =~ /[XO]/ }
  end

  # Check if a given cell has already been filled
  def taken?( player_input )
    position( player_input ) =~ /[XO]/ ? true : false
  end

  # Determines valid move if cell is free and if position is within range
  def valid_move?( player_input )
    player_input.to_i >= 1 && player_input.to_i <= 9 && !taken?( player_input )
  end

  def update( player_input, player )
    if valid_move?( player_input )
      index = input_to_index( player_input )
      @cells[ index ] = player.token
    end
  end

  private

  def input_to_index( input )
    input.to_i - 1
  end
end
