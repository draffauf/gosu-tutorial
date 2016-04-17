require_relative 'has_sprite'

class BoardMap
  SPRITE_SHEET = "map"
  SPRITE_SIZE  = 100
  Z_INDEX      = 0

  STATES = {
    default: 0,
    visited: 1
  }

  attr_reader :position

  include HasSprite

  def initialize position: Position.new
    @position    = position
    @position.z  = Z_INDEX
    sprite.value = STATES[:default]
  end

  def visited!
    @visited     = true
    sprite.value = STATES[:visited]
  end
end
