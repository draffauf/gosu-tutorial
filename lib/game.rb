class Game
  class << self
    attr_accessor :game_window
    attr_accessor :input_manager
    attr_accessor :scene
  end

  def self.setup game_window:   GameWindow.new,
                 input_manager: InputManager.new,
                 scene:         Scene.new
    @game_window   = game_window
    @input_manager = input_manager
    @scene         = scene
    @input_manager.target = game_window
  end

  def self.start
    game_window.show
  end
end
