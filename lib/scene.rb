class Scene
  attr_reader :sprites

  def initialize
    @board = Board.new
    @sprites = [@board]
  end

  def update
    sprites.each{ |sprite| sprite.update }
  end

  def draw
    sprites.each{ |sprite| sprite.draw }
  end
end
