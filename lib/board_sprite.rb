class BoardSprite
  attr_reader :x, :y, :z,
              :sprite_sheet,
              :value,
              :offset_y,
              :width

  def initialize x, y, z = 0
    @x = x
    @y = y
    @z = z

    @sprite_sheet = "map"
    @value        = 0
    @offset_y     = 0
    @width        = 100
  end

  def draw
    sprite.draw
  end

  def value= _value
    @value = _value
    @sprite= nil
    @tile  = nil
  end

  private

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
    @tile_set ||= TileSet.new sprite_sheet, width
  end

end
