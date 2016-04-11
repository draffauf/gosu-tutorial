class Sprite
  attr_reader :position,
              :sprite_sheet,
              :value,
              :offset_y,
              :width

  def initialize position = Position.new(0, 0, 0)
    @position = position

    @sprite_sheet = "map"
    @value        = 0
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
      tile: tile,
      position: position
    })
  end

  def tile
    @tile ||= tile_set.tiles[value]
  end

  def tile_set
    @tile_set ||= TileSet.new sprite_sheet, width
  end

end
