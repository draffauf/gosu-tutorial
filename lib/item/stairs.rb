module Item
  class Stairs < Base
    def interact(player)
      player.health = 0
    end

    private

    def state; :stairs; end
  end
end
