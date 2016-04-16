require_relative 'has_sprite'

class Heart
  STATES = {
    unfillable: 0,
    fillable:   1,
    filled:     2
  }

  SPRITE_SHEET = "hearts"
  SPRITE_SIZE  = 50
  Z_INDEX      = 0

  attr_reader :position,
              :count,
              :player

  include HasSprite

  def initialize position: Position.new,
                 count:,
                 player:
    @position     = position
    @count        = count
    @player       = player

    @position.z   = Z_INDEX
    sprite.value  = STATES[state]
  end

  private

  def state
    if (player.health >= count)
      :filled
    elsif (player.max_health >= count)
      :fillable
    else
      :unfillable
    end
  end
end
