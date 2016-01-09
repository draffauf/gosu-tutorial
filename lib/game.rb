class Game
  attr_reader :game_window,
              :input_manager

  def initialize
    @game_window   = GameWindow.new
    @input_manager = InputManager.new
  end

  def start
    game_window.show
  end
end
