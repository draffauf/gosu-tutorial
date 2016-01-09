class Map
  TILE_SETS_PATH   = "graphics/tile_sets"
  DEFAULT_TILE_SET = "tile_set"
  EXTENSION        = ".png"
  TILEABLE         = true
  DEFAULT_TILE_SIZE= 32

  attr_reader :tile_size

  def initialize tile_size = DEFAULT_TILE_SIZE
    @tile_size = tile_size
  end

  def update
  end

  def draw
    z_index = 0
    tile = tiles[0]

    columns.times do |x|
      rows.times do |y|
        draw_tile tile,
                  x * tile_size,
                  y * tile_size,
                  z_index
      end
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
