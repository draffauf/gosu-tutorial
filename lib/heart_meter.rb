class HeartMeter
  COUNT        = 10
  SPRITE_WIDTH = 50
  SPRITE_Y     = 0

  attr_reader :player, :health, :max_health

  def initialize player
    @player     = player
    @health     = player.health
    @max_health = player.max_health
  end

  def update
    if health != player.health
      self.health = player.health
    end

    if max_health != player.max_health
      self.max_health = player.max_health
    end
  end

  def draw
    hearts.each { |heart| heart.draw }
  end

  private

  def health= value
    @health = value
    reset
  end

  def max_health= value
    @max_health = value
    reset
  end

  def hearts
    @hearts ||= [].tap do |hearts|
      COUNT.times do |index|
        hearts << Heart.new(position: position(index),
                            count:    index + 1,
                            player:   player)
      end
    end
  end

  def reset
    @hearts = nil
  end

  def position index
    Position.new(
      x: index * SPRITE_WIDTH,
      y: SPRITE_Y
    )
  end
end
