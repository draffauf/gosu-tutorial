require_relative './sprite'

class BoardItem < Sprite
  def initialize x, y
    super x, y

    @z            = 1
    @sprite_sheet = "items"
    @value        = 0
    @offset_y     = -10
    @width        = 100
  end
end
