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

  def move player:,
           delta_position: Position.new
    new_position       = player.board_position + delta_position
    new_board_position = position(new_position)
    new_board_position.occupy(player, new_position)
  end

  def starting_position
    @starting_position ||= Position.new(x: 0, y: 2)
  end

private

  def starting_position? position
    position.x == starting_position.x &&
    position.y == starting_position.y &&
    position.z == starting_position.z
  end

  def within_bounds? y, x
    y.between?(0, rows    - 1) &&
    x.between?(0, columns - 1)
  end

  def positions
    @positions ||= [].tap do |board_positions|
      rows.times do |row|
        position_row   = []

        columns.times do |column|
          board_position = board_position(  row: row,
                                            column: column)

          starting_item  = generate_item(   row: row,
                                            column: column,
                                            position: board_position)

          position_row << BoardPosition.new(position: board_position,
                                            starting_item: starting_item)
        end

        board_positions << position_row
      end
    end
  end

  def generate_item row:,
                    column:,
                    position:
    if !starting_position?(Position.new(x: column, y: row))
      Item::Base.random_item.new(position: position.dup)
    else
      nil
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
