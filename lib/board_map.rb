class BoardMap
  SPRITE_SHEET = "map"
  SPRITE_SIZE  = 100


  def initialize position = Position.new
    @position = position
    @position.z = 0
  end

  def sprite
    @sprite ||= Sprite.new @position,
                           SPRITE_SHEET,
                           SPRITE_SIZE
  end

  # Delegate sprite questions to sprite
  def draw; sprite.draw; end
  def value=(value); sprite.value=(value); end
end
