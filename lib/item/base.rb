require_relative '../has_sprite'

module Item
  class Base
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

    def self.random_item
      [Health, Damage, Poison].sample
    end

    attr_reader :position

    include HasSprite

    def initialize position: Position.new
      @position   = position
      @position.z = Z_INDEX
      @position.y = position.y + Y_OFFSET
      sprite.value = sprite_value
    end

    def sprite_value
      STATES[state]
    end

    def interact(player)
      raise Exception.new('not implemented')
    end

    private

    def state
      :health
    end
  end
end
