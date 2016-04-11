class BoardItem
  SPRITE_SHEET = "items"
  SPRITE_SIZE  = 100

  attr_reader :position

  def initialize position = Position.new
    @position = position
    @position.z = 1
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
