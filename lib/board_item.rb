require_relative 'has_sprite'

class BoardItem
  SPRITE_SHEET = "items"
  SPRITE_SIZE  = 100
  Z_INDEX      = 1
  Y_OFFSET     = -10

  STATES = {
    health: 0,
    damage: 1,
    poison: 2,
    stairs: 3
  }

  attr_reader :position

  include HasSprite

  def initialize position: Position.new
    @position   = position
    @position.z = Z_INDEX
    @position.y = position.y + Y_OFFSET

    sprite.value = STATES[state]
  end

  def interact(player)
    player.health += 1
  end

  private

  def state
    STATES.keys.sample
  end
end
