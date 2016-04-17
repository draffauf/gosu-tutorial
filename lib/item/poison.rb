require_relative 'base.rb'

module Item
  class Poison < Base
    def interact(player)
      player.health -= 2
    end

    private

    def state; :poison; end
  end
end
