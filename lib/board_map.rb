require_relative 'has_sprite'

class BoardMap
  SPRITE_SHEET = "map"
  SPRITE_SIZE  = 100

  attr_accessor :position

  include HasSprite

  def initialize position = Position.new
    @position = position
    @position.z = 0
  end
end
