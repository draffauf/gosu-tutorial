require_relative './sprite'

class Heart < Sprite
  attr_writer :value

  def initialize position = Position.new
    @position = position
    @position.z = 0
    super position

    @sprite_sheet = "hearts"
    @value        = 0
    @offset_y     = 0
    @width        = 50
  end
end
