class Tile
  def initialize sprite:, x: 0, y: 0, z: 0
    @sprite = sprite
    @x = x
    @y = y
    @z = z
  end

  def draw
    sprite.draw x, y, z
  end

private

  attr_reader :sprite, :x, :y, :z
end
