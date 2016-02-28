require_relative './board_sprite'

class BoardMap < BoardSprite
  def initialize x, y
    super x, y

    @z            = 0
    @sprite_sheet = "map"
    @value        = 0
    @offset_y     = 0
    @width        = 100
  end
end
