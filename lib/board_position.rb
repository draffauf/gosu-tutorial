class BoardPosition
  Y_OFFSET = -10
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
    background.visited!
    player.position = position
    player.health += 1
  end

  private

  def item
    @item ||= BoardItem.new(position + Position.new(y: Y_OFFSET))
  end

  def background
    @background ||= BoardMap.new(position: position)
  end
end
