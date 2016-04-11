require_relative './sprite'

class BoardItem
  attr_reader :position

  def initialize position = Position.new
    @position = position
    @position.z = 1
  end

  def sprite
    return @sprite if @sprite

    sprite_sheet = "items"
    sprite_size = 100
    @sprite = Sprite.new @position,
                         sprite_sheet,
                         sprite_size
  end

  #
  # Delegate to sprite
  #
  def draw
    sprite.draw
  end

  def value= value
    sprite.value= value
  end

end
