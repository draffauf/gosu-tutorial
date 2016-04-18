require_relative 'has_sprite'

class Player
  SPRITE_SHEET = "player"
  SPRITE_SIZE  = 100
  Y_OFFSET     = -35
  Z_INDEX      = 2

  attr_reader   :position,
                :health,
                :max_health,
                :experience,
                :next_level

  attr_accessor :board_position

  include HasSprite

  def initialize
    @position   = Position.new

    # Stats: data clump?
    @health     = 3
    @max_health = 5
    @experience = 0
    @next_level = 3
  end

  def update
  end

  def health= value
    @health = value if value.between?(0, max_health)
  end

  def position= value
    adjusted_value = Position.new(
      x: value.x,
      y: value.y + Y_OFFSET,
      z: Z_INDEX
    )
    @position = adjusted_value
    sprite.position = adjusted_value
  end

  def move new_board_position:,
           new_position:
    self.board_position = new_board_position
    self.position       = new_position
  end
end
