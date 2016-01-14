require_relative '../spec_helper'

describe GameWindow do
  let(:game_window)   { GameWindow.new }
  let(:scene)         { Scene.new }
  let(:input_manager) { InputManager.new.tap { |im| im.target = game_window } }
  let(:width)         { 1440 }
  let(:height)        { 900 }
  let(:keys)          { { escape: Gosu::KbEscape } }

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
      Game.game_window   = game_window
      Game.scene         = scene
      Game.input_manager = input_manager

      expect(game_window).to receive(:close)
      game_window.button_down keys[:escape]
    end
  end

  describe ".receive_input" do
    it "closes the window when escape is received" do
      Game.game_window   = game_window
      Game.scene         = scene
      Game.input_manager = input_manager

      input = keys[:escape]
      expect(game_window).to receive(:close)
      expect(Game.scene ).to receive(:receive_input).with(input)
      game_window.receive_input input
    end
  end

  describe ".update" do
    it "updates the scene" do
      Game.game_window = game_window
      Game.scene       = scene

      expect(scene).to receive(:update)
      game_window.update
    end
  end

  describe ".draw" do
    it "draws the scene" do
      Game.game_window = game_window
      Game.scene       = scene

      expect(scene).to receive(:draw)
      game_window.draw
    end
  end
end
