class Player
  attr_reader :health,
              :max_health,
              :experience,
              :next_level

  attr_accessor :x, :y

  def initialize
    @health     = 3
    @max_health = 3
    @experience = 0
    @next_level = 3
    @x = 0
    @y = 2
  end

  def update
  end

  def draw
  end
end
