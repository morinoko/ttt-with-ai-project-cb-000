class Board
  attr_accessor :cells

  def initialize
    @cells = []
    create_clear_cells
  end

  def reset!
    @cells = []
    create_clear_cells
  end

  def display
    puts " #{@cells[ 0 ]} | #{@cells[ 1 ]} | #{@cells[ 2 ]} "
    puts "-----------"
    puts " #{@cells[ 3 ]} | #{@cells[ 4 ]} | #{@cells[ 5 ]} "
    puts "-----------"
    puts " #{@cells[ 6 ]} | #{@cells[ 7 ]} | #{@cells[ 8 ]} "
  end

  def position( user_input )
    index = input_to_index( user_input )
    @cells[ index ]
  end

  def full?
    @cells.all? { |cell| cell =~ /[XO]/ }
  end

  def turn_count
    @cells.count{ |cell| cell =~ /[XO]/ }
  end

  # Check if a given cell has already been filled
  def taken?( position )
    position( position ) =~ /[XO]/ ? true : false
  end

  # Determines valid move if cell is free and if position is within range
  def valid_move?( position )
    position.to_i >= 1 && position.to_i <= 9 && !taken?(position)
  end

  def update( position, player )
    if valid_move?( position )
      index = input_to_index( position )
      @cells[ index ] = player.token
    end
  end

  private

  def create_clear_cells
    9.times { @cells << " " }
  end

  def input_to_index( position )
    position.to_i - 1
  end
end
