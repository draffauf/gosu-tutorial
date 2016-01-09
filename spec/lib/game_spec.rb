require_relative '../spec_helper'

describe Game do
  before { Game.setup }

  describe "#setup" do
    it "has a game window" do
      expect(Game.game_window).to be_an_instance_of GameWindow
    end

    it "has an input manager" do
      expect(Game.input_manager).to be_an_instance_of InputManager
    end

    it "has an input manager with a target" do
      expect(Game.input_manager.target).to be_an_instance_of GameWindow
    end

    it "has a scene" do
      expect(Game.scene).to be_an_instance_of Scene
    end
  end

  describe "#start" do
    it "shows the game window" do
      expect_any_instance_of(GameWindow).to receive(:show)
      Game.start
    end
  end
end
