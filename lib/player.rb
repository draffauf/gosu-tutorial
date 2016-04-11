class Player
  attr_reader   :health,
                :max_health,
                :experience,
                :next_level

  attr_accessor :position

  def initialize position = Position.new
    @position   = position
    @health     = 3
    @max_health = 5
    @experience = 0
    @next_level = 3
  end

  def update
  end

  def draw
  end

  def health= value
    @health = value if value.between?(0, max_health)
  end
end
