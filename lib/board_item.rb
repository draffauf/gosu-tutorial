require_relative './board_sprite'

class BoardItem < BoardSprite
  def initialize x, y
    super x, y

    @z            = 1
    @sprite_sheet = "items"
    @value        = 0
    @offset_y     = -10
    @width        = 100
  end
end
