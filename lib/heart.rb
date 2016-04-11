require_relative './sprite'

class Heart
  attr_reader :position

  def initialize position = Position.new
    @position = position
    @position.z = 0
  end

  def sprite
    return @sprite if @sprite

    sprite_sheet = "hearts"
    sprite_size = 50
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
