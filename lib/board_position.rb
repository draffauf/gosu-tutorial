class BoardPosition
  attr_reader :x, :y

  def initialize x, y
    @x = x
    @y = y
    @is_open = true
  end

  def update
  end

  def draw
    background.draw
    item.draw if open?
  end

  def open?
    @is_open
  end

  def occupy
    @is_open = false
  end

  private

  def item
    @item ||= BoardItem.new x, y
  end

  def background
    @background ||= BoardMap.new x, y
  end
end
