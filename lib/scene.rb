class Scene
  attr_reader :sprites

  def initialize
    @board   = Board.new
    @player  = Player.new
    @sprites = [@board, @player]
  end

  def update
    sprites.each{ |sprite| sprite.update }
  end

  def draw
    sprites.each{ |sprite| sprite.draw }
  end

  private

  attr_reader :board, :player
end
