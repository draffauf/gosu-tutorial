require_relative './sprite'

class BoardMap < Sprite
  def initialize position = Position.new
    @position = position
    @position.z = 0
  end

  def sprite
    return @sprite if @sprite

    sprite_sheet = "map"
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
