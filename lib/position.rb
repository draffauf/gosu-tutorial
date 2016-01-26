class Position
  attr_reader :x, :y, :z

  def initialize x: 0, y: 0, z: 0
    @x, @y, @z = x, y, z
  end

  def + position
    Position.new(
      x: x + position.x,
      y: y + position.y,
      z: z + position.z
    )
  end
end
