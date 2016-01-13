class TileSet
  EXTENSION      = "png"
  TILE_SETS_PATH = "graphics/sprite_sheets"
  TILE_SET       = "map"
  TILE_SIZE      = 100 # We're assuming square tiles for now
  TILEABLE       = true

  attr_reader :tile_set,
              :tile_size

  def initialize tile_set  = TILE_SET,
                 tile_size = TILE_SIZE
    @tile_set  = tile_set
    @tile_size = tile_size
  end

  def tiles
    @tiles ||= Gosu::Image.load_tiles Game.game_window,
                                      file_path,
                                      tile_size,
                                      tile_size,
                                      TILEABLE
  end

private

  def file_path
    @file_path ||= "#{TILE_SETS_PATH}/#{tile_set}.#{EXTENSION}"
  end
end
