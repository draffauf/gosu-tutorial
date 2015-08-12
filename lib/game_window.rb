require 'gosu'

class GameWindow < Gosu::Window
  def initialize width  = 800,
                 height = 600
    super width, height
    self.caption = caption
  end

  def update
  end

  def draw
  end

  def button_down id
    close if id == Gosu::KbEscape
  end

  def caption
    'Game Window Caption'
  end
end
