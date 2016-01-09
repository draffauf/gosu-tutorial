class Game
  class << self
    attr_accessor :game_window
    attr_accessor :input_manager
  end

  def self.setup
    @game_window = GameWindow.new
    @input_manager = InputManager.new
    input_manager.target = game_window
  end

  def self.start
    game_window.show
  end
end
