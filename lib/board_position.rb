class BoardPosition
  attr_reader :x, :y

  def initialize y, x
    @y = y
    @x = x
  end

  def update
  end

  def draw
    background.draw
    item.draw
  end

  def item
    @item ||= BoardItem.new x, y
  end

  def background
    @background ||= BoardBackground.new x, y
  end
end
