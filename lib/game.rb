require 'gosu'

class Game < Gosu::Window
  def initialize
    super 640, 480
    self.caption = caption
  end

  def update
  end

  def draw
  end

  def caption
    'Game Window Caption'
  end
end
