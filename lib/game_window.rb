require 'gosu'

class GameWindow < Gosu::Window
  def initialize width  = 1440,
                 height = 900
    super width, height, true
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
    Game.scene.receive_input input
  end
end
