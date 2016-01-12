class Board
  SCREEN_WIDTH  = 1440 #TODO MOVE
  SCREEN_HEIGHT = 900  #TODO MOVE
  BACKGROUND_OFFSET_Y = -14

  attr_reader :rows,
              :columns,
              :tile_size

  def initialize rows = 5,
                 columns = 9,
                 tile_size = 100
    @rows      = rows
    @columns   = columns
    @tile_size = tile_size
  end

  def update
  end

  def draw
    positions.each do |row|
      row.each do |position|
        position.draw
      end
    end
  end

private

  def offset_x
    @offset_x ||= (SCREEN_WIDTH - columns * position_width) / 2
  end

  def offset_y
    @offset_y ||= (SCREEN_HEIGHT - rows * position_height) / 2
  end

  def position_width
    @position_width ||= tile_size
  end

  def position_height
    @position_height ||= tile_size + BACKGROUND_OFFSET_Y
  end

  def positions
    return @positions if @positions

    @positions ||= [].tap do |board_positions|
      rows.times do |row|
        row_positions = []

        columns.times do |column|
          row_positions << BoardPosition.new(
            offset_y + row    * position_height,
            offset_x + column * position_width
          )
        end

        board_positions << row_positions
      end
    end
  end
end
