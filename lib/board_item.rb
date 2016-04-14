require_relative 'has_sprite'

class BoardItem
  SPRITE_SHEET = "items"
  SPRITE_SIZE  = 100

  attr_accessor :position

  include HasSprite

  def initialize position = Position.new
    @position = position
    @position.z = 1
  end
end
