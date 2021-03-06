class Tile
  attr_accessor :position

  def initialize tile:, position: Position.new
    @tile = tile
    @position = position
  end

  def draw
    tile.draw position.x,
              position.y,
              position.z
  end

private

  attr_reader :tile
end
