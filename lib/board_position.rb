class BoardPosition
  attr_reader :position

  def initialize position: Position.new
    @position = position
    @is_open  = true
    @delta_position
  end

  def update
  end

  def draw
    background.draw
    item.draw if item
  end

  def open?
    @is_open
  end

  def occupy player
    background.visited!
    player.position = position
    item.interact(player)
    @item = nil
    @is_open = false
  end

  private

  def item
    if open?
      @item ||= BoardItem.new(position: position.dup)
    end
  end

  def background
    @background ||= BoardMap.new(position: position.dup)
  end
end
