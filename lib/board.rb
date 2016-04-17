class Board
  SCREEN_WIDTH        = 1440
  SCREEN_HEIGHT       = 900
  BACKGROUND_OFFSET_Y = -14

  attr_reader :rows,
              :columns,
              :tile_size,
              :tiles

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

  def position _position
    if within_bounds? _position.y, _position.x
      positions[_position.y][_position.x]
    else
      NullBoardPosition.new
    end
  end

private

  def within_bounds? y, x
    y.between?(0, rows    - 1) &&
    x.between?(0, columns - 1)
  end

  def positions
    @positions ||= [].tap do |board_positions|
      rows.times do |row|
        position_row = []

        columns.times do |column|
          position_row << BoardPosition.new(position: board_position(
                                                        row:    row,
                                                        column: column))
        end

        board_positions << position_row
      end
    end
  end

  def board_position row:, column:
    Position.new(
      x: offset_x + column * position_width,
      y: offset_y + row    * position_height
    )
  end

  def position_width
    @position_width ||= tile_size
  end

  def position_height
    @position_height ||= tile_size + BACKGROUND_OFFSET_Y
  end

  def offset_x
    @offset_x ||= (SCREEN_WIDTH - columns * position_width) / 2
  end

  def offset_y
    @offset_y ||= (SCREEN_HEIGHT - rows * position_height) / 2
  end
end
