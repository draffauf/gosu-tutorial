class Map
  TILE_SETS_PATH   = "graphics/tile_sets"
  DEFAULT_TILE_SET = "big_tiles"
  EXTENSION        = ".png"
  TILEABLE         = true
  DEFAULT_TILE_SIZE= 100
  TILE_OFFSET_Y    = 16

  attr_reader :tile_size

  def initialize tile_size = DEFAULT_TILE_SIZE
    @tile_size = tile_size
  end

  def update
  end

  def draw
    z_index = 0
    tile = tiles[0]
    is_first_row = true
    map_offset_x = (1440 - columns * DEFAULT_TILE_SIZE) / 2
    map_offset_y = (900  - rows * (DEFAULT_TILE_SIZE - TILE_OFFSET_Y)) / 2

    rows.times do |y|
      columns.times do |x|
        x1 = map_offset_x + x * tile_size
        y1 = map_offset_y + y * tile_size - (y * TILE_OFFSET_Y)
        z1 = z_index

        draw_tile tile, x1, y1, z1
      end

      is_first_row = false
    end
  end

private

  def z_index
  end

  def columns
    columns = 10
  end

  def rows
    rows = 5
  end

  def tiles
    @tiles ||= Gosu::Image.load_tiles Game.game_window,
                                      file_path,
                                      DEFAULT_TILE_SIZE,
                                      DEFAULT_TILE_SIZE,
                                      TILEABLE
  end

  def draw_tile tile, x, y, z
    tile.draw x, y, z
  end

  def file_path
    @file_path ||= [
        TILE_SETS_PATH,
        DEFAULT_TILE_SET
      ].join('/') << EXTENSION
  end

end
