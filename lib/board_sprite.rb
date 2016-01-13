class BoardSprite
  Z_INDEX = 0

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
    @tile ||= tile_set.tiles[0]
  end

  def tile_set
    @tile_set ||= TileSet.new "map"
  end
end
