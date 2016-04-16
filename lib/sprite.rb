class Sprite
  DEFAULT_SHEET = "map"
  DEFAULT_SIZE  = 100
  DEFAULT_TILE  = 0

  attr_accessor :position

  attr_reader   :sprite_sheet,
                :value,
                :offset_y,
                :width

  def initialize position     = Position.new,
                 sprite_sheet = DEFAULT_SHEET,
                 size         = DEFAULT_SIZE
    @position     = position
    @sprite_sheet = sprite_sheet
    @width        = size
    @value        = DEFAULT_TILE
  end

  def draw
    sprite.draw
  end

  def value= _value
    @value = _value
    reset
  end

  def position= _position
    @position = _position
    reset
  end

  private

  def reset
    @sprite = nil
    @tile   = nil
  end

  def sprite
    @sprite ||= Tile.new(
      tile: tile,
      position: position
    )
  end

  def tile
    @tile ||= tile_set.tiles[value]
  end

  def tile_set
    @tile_set ||= TileSet.new(sprite_sheet, width)
  end

end
