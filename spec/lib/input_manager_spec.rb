require_relative '../spec_helper'

describe InputManager do
  describe ".new" do
    it "creates an instance of the InputManager" do
      expect(InputManager.new).to be_an_instance_of InputManager
    end

    it "sets an instance variable for the GameWindow" do
      game_window = GameWindow.new
      input_manager = InputManager.new(game_window)
      expect(input_manager.instance_variable_get(:@game_window)).to eql(game_window)
    end
  end

  describe ".button_down" do
    it "receives the escape input and calls close" do
      input_manager = InputManager.new
      expect_any_instance_of(InputManager).to receive(:close)
      input_manager.button_down Gosu::KbEscape
    end

    it "receives the escape input and calls close on a GameWindow" do
      input_manager = InputManager.new
      expect_any_instance_of(GameWindow).to receive(:close)
      input_manager.button_down Gosu::KbEscape
    end
  end
end
