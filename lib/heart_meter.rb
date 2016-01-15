class HeartMeter
  def initialize player
    @player     = player
    @health     = player.health
    @max_health = player.max_health
  end

  def update
    self.health=(player.health)         if health     != player.health
    self.max_health=(player.max_health) if max_health != player.max_health
  end

  def draw
    hearts.each { |heart| heart.draw }
  end

  private

  attr_reader :player, :health, :max_health

  def health= value
    @health = value
    @hearts = nil
  end

  def max_health= value
    @max_health = value
    @hearts = nil
  end

  def hearts
    count = 10
    width = 50
    y     = 0

    @hearts ||= [].tap do |hearts|
      count.times do |index|
        zero_based_index = index - 1
        heart = Heart.new(zero_based_index * width, y)
        heart.value = 1 if player.max_health > zero_based_index
        heart.value = 2 if player.health     > zero_based_index
        hearts << heart
      end
    end
  end
end
