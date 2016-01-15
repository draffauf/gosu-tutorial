class Heart < BoardSprite
  attr_writer :value

  def initialize x, y
    super x, y

    @z            = 0
    @sprite_sheet = "hearts"
    @value        = 0
    @offset_y     = 0
    @width        = 50
  end
end
