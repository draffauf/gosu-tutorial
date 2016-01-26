class Player
  attr_reader :health,
              :max_health,
              :experience,
              :next_level

  attr_accessor :position

  def initialize
    @health     = 3
    @max_health = 5
    @experience = 0
    @next_level = 3
    @position   = Position.new y: 2, x: 0
  end

  def update
  end

  def draw
  end

  def health= value
    @health = value if value.between?(0, max_health)
  end

  def x; position.x; end
  def y; position.y; end
  def z; position.z; end
end
