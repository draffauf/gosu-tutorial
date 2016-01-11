class Scene
  attr_reader :sprites

  def initialize
    @sprites = [
      TileMap.new,
      ItemMap.new
    ]
  end

  def update
    sprites.each{ |sprite| sprite.update }
  end

  def draw
    sprites.each{ |sprite| sprite.draw }
  end
end
