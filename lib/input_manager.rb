class InputManager
  attr_reader :game_window
  
  def initialize game_window = GameWindow.new
    @game_window = game_window
  end

  def button_down id
    close
  end

  private

  def close
    game_window.close
  end
end
