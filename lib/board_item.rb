require_relative 'board_sprite'

class BoardItem < BoardSprite
  def initialize x, y
    super x, y

    @z            = 1
    @sprite_sheet = "items"
    @offset_y     = -10
    @width        = 100
  end

  def exit?
    false
  end
end

class BoardItemHealth < BoardItem
  def initialize x, y
    super x, y
    @value = 0
  end

  def interact player
    player.health += 1
  end
end

class BoardItemEnemy < BoardItem
  def initialize x, y
    super x, y
    @value = 1
  end

  def interact player
    player.health -= 1
  end
end

class BoardItemStrongEnemy < BoardItem
  def initialize x, y
    super x, y
    @value = 2
  end

  def interact player
    player.health -= 2
  end
end

class BoardItemExit < BoardItem
  def initialize x, y
    super x, y
    @value = 3
  end

  def interact player
  end

  def exit?
    true
  end
end

class BoardItemNull < BoardItem
  def initialize x, y
    super x, y
    @value = 4
  end

  def interact player
  end
end
