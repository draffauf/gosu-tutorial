class Board
  TILE_SETS_PATH      = "graphics/tile_sets"
  DEFAULT_TILE_SET    = "big_tiles"
  EXTENSION           = ".png"
  TILEABLE            = true
  DEFAULT_TILE_SIZE   = 100
  SCREEN_WIDTH        = 1440
  SCREEN_HEIGHT       = 900
  BACKGROUND_OFFSET_Y = -14

  attr_reader :rows,
              :columns,
              :tile_size,
              :tiles

  def initialize rows = 5,
                 columns = 9,
                 tile_size = DEFAULT_TILE_SIZE
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

  def positions
    @positions ||= [].tap do |board_positions|
      rows.times do |row|
        position_row = []

        columns.times do |column|
          position_row << Tile.new({
            sprite: sprite,
            x:      map_offset_x + column * position_width,
            y:      map_offset_y + row    * position_height,
            z:      z_index
          })
        end

        board_positions << position_row
      end
    end
  end

  def sprite
    tile_sprites[0]
  end

  def position_width
    tile_size
  end

  def position_height
    tile_size + BACKGROUND_OFFSET_Y
  end

  def map_offset_x
    @map_offset_x ||= (1440 - columns * position_width) / 2
  end

  def map_offset_y
    @map_offset_y ||= (900 - rows * position_height) / 2
  end

  def z_index
    0
  end

  def tile_sprites
    @tile_sprites ||= Gosu::Image.load_tiles Game.game_window,
                                             file_path,
                                             DEFAULT_TILE_SIZE,
                                             DEFAULT_TILE_SIZE,
                                             TILEABLE
  end

  def file_path
    @file_path ||= [
        TILE_SETS_PATH,
        DEFAULT_TILE_SET
      ].join('/') << EXTENSION
  end

  class Tile
    def initialize sprite:, x: 0, y: 0, z: 0
      @sprite = sprite
      @x = x
      @y = y
      @z = z
    end

    def draw
      sprite.draw x, y, z
    end

  private

    attr_reader :sprite, :x, :y, :z

  end

end
