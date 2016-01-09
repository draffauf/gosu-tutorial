class Map
  TILE_SETS_PATH   = "graphics/tile_sets"
  DEFAULT_TILE_SET = "tile_set"
  EXTENSION        = ".png"
  TILEABLE         = true
  DEFAULT_TILE_SIZE= 32

  attr_reader :tiles

  def initialize
    @tiles = Gosu::Image.load_tiles Game.game_window,
                                    file_path,
                                    DEFAULT_TILE_SIZE,
                                    DEFAULT_TILE_SIZE,
                                    TILEABLE
  end

  def update
  end

  def draw
    @tiles[0].draw 0, 0, 0
  end

private

  def file_path
    @file_path ||= [
        TILE_SETS_PATH,
        DEFAULT_TILE_SET
      ].join('/') << EXTENSION
  end

end
