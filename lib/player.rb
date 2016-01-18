class Player < BoardSprite
  attr_reader :health,
              :max_health,
              :experience,
              :next_level

  attr_accessor :board_x,
                :board_y,
                :x,
                :y

  def initialize x = 0, y = 0
    super x, y

    @health     = 3
    @max_health = 5
    @experience = 0
    @next_level = 3
    @board_x = 0
    @board_y = 2

    @z            = 2
    @sprite_sheet = "player"
    @offset_y     = 0
    @width        = 100
  end

  def update
  end

  def health= value
    @health = value if value.between?(0, max_health)
  end

  def dead?
    health == 0
  end

  def position y, x
    @y = y - 20
    @x = x
    @sprite = nil
  end
end
