require 'gosu'

class GameWindow < Gosu::Window
  def initialize width  = 800,
                 height = 600
    super width, height
    self.caption = 'Game Window Caption'
  end

  def update
    Game.scene.update
  end

  def draw
    Game.scene.draw
  end

  def button_down id
    Game.input_manager.button_down id
  end

  def receive_input input
    close if input == Gosu::KbEscape
  end
end
