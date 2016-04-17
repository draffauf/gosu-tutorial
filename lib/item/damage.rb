module Item
  class Damage < Base
    def interact(player)
      player.health -= 1
    end

    private

    def state; :damage; end
  end
end
