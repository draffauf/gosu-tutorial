require_relative './sprite'

class BoardItem < Sprite
  def initialize position = Position.new
    @position     = position
    @position.z   = 1
    super position

    @sprite_sheet = "items"
    @width        = 100
  end
end
