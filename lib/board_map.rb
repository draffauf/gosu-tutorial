require_relative './sprite'

class BoardMap < Sprite
  def initialize position = Position.new
    @position     = position
    @position.z   = 0
    super position

    @sprite_sheet = "map"
    @width        = 100
  end
end
