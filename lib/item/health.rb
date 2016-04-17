require_relative 'base.rb'

module Item
  class Health < Base
    def interact(player)
      player.health += 1
    end

    private

    def state; :health; end
  end
end
