require_relative '../spec_helper'

describe GameWindow do
  let(:game_window) { GameWindow.new }
  let(:width)       { 800 }
  let(:height)      { 600 }
  let(:keys)        { { escape: Gosu::KbEscape } }

  describe ".new" do
    it "returns a GameWindow object" do
      expect(game_window).to be_an_instance_of GameWindow
    end

    it "sets a default width" do
      expect(game_window.width).to eq width
    end

    it "sets a default height" do
      expect(game_window.height).to eq height
    end
  end

  describe ".button_down" do
    it "closes the window when the button pressed is Escape" do
      Game.game_window = game_window
      Game.input_manager = InputManager.new.tap { |im| im.target = game_window }
      expect(game_window).to receive(:close)
      game_window.button_down keys[:escape]
    end
  end
end
