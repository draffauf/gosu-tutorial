class BoardPosition
  attr_reader :position

  def initialize position = Position.new
    @position = position
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

  def occupy player
    @is_open = false
    player.health += 1
  end

  private

  def item
    @item ||= BoardItem.new(position + Position.new(y: -10))
  end

  def background
    @background ||= BoardMap.new position
  end
end
