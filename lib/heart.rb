require_relative './sprite'

class Heart < Sprite
  def initialize position = Position.new
    @position     = position
    @position.z   = 0
    super position

    @sprite_sheet = "hearts"
    @width        = 50
  end
end
