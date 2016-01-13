class BoardPosition
  attr_reader :x, :y

  def initialize x, y
    @x = x
    @y = y
  end

  def update
  end

  def draw
    background.draw
  end

  private

  def background
    @background ||= BoardSprite.new x, y
  end
end
