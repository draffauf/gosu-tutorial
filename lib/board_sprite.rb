class BoardSprite
  attr_reader :x, :y

  def initialize x, y
    @x = x
    @y = y
  end

  def draw
    sprite.draw
  end

  private

  def z;            0     end
  def sprite_sheet; "map" end
  def value;        0     end
  def offset_y;     0     end

  def sprite
    @sprite ||= Tile.new({
      sprite: tile,
      x:      x,
      y:      y + offset_y,
      z:      z
    })
  end

  def tile
    @tile ||= tile_set.tiles[value]
  end

  def tile_set
    @tile_set ||= TileSet.new sprite_sheet
  end
end
