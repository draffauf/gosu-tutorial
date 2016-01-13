class BoardSprite
  TILE_SETS_PATH      = "graphics/tile_sets"
  DEFAULT_TILE_SET    = "big_tiles"
  EXTENSION           = ".png"
  TILEABLE            = true
  DEFAULT_TILE_SIZE   = 100
  Z_INDEX             = 0

  attr_reader :x, :y

  def initialize x, y
    @x = x
    @y = y
  end

  def draw
    sprite.draw
  end

  private

  def sprite
    @sprite ||= Tile.new({
      sprite: tile,
      x:      x,
      y:      y,
      z:      Z_INDEX
    })
  end

  def tile
    @sprite ||= sprites[0]
  end

  def sprites
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
end
