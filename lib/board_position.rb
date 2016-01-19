class BoardPosition
  attr_reader :item, :background

  def initialize item, background
    @item = item
    @background = background
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

  def exit?
    item.exit?
  end

  def occupy player
    @is_open = false
    background.value = 1
    item.interact(player)
  end
end
