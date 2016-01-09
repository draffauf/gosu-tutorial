class Scene
  attr_reader :sprites

  def initialize
    @map = Map.new
    @sprites = [@map]
  end

  def update
    sprites.each{ |sprite| sprite.update }
  end

  def draw
    sprites.each{ |sprite| sprite.draw }
  end
end
