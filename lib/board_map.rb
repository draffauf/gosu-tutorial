require_relative 'has_sprite'

class BoardMap
  SPRITE_SHEET = "map"
  SPRITE_SIZE  = 100

  STATES = {
    default: 0,
    visited: 1
  }

  attr_accessor :position

  include HasSprite

  def initialize position: Position.new
    @position = position
    @position.z = 0
    sprite.value = STATES[:default]
  end

  def visited!
    @visited = true
    sprite.value = STATES[:visited]
  end
end
