module HasSprite
  def sprite
    @sprite ||= Sprite.new self.position,
                           self.class::SPRITE_SHEET,
                           self.class::SPRITE_SIZE
  end

  # Delegate sprite questions to sprite
  def draw
    sprite.draw
  end

  def value= value
    sprite.value= value
  end
end
