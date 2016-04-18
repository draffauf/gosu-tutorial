class BoardPosition
  attr_reader :position, :item

  def initialize position: Position.new,
                 starting_item:
    @position = position
    @item     = starting_item
    @is_open  = true
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

  def occupy player, new_board_position
    return unless open?

    player.move new_board_position: new_board_position,
                new_position: position
    interact_with!(player)
    background.visited!
    close!
  end

  private

  def close!
    @is_open = false
  end

  def interact_with! player
    return unless item
    item.interact(player)
    @item = nil
  end

  def background
    @background ||= BoardMap.new(position: position.dup)
  end
end
