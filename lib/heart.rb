require_relative 'has_sprite'

class Heart
  SPRITE_SHEET = "hearts"
  SPRITE_SIZE  = 50

  attr_reader :position

  include HasSprite

  def initialize position = Position.new
    @position = position
    @position.z = 0
  end
end
