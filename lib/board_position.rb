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
    item.draw
  end

  private

  def item
    @item ||= BoardItem.new x, y
  end

  def background
    @background ||= BoardMap.new x, y
  end
end
