class Heart
  SPRITE_SHEET = "hearts"
  SPRITE_SIZE  = 50

  attr_reader :position

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
