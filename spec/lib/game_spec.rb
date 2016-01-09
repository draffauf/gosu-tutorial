require_relative '../spec_helper'

describe Game do
  let(:game) { Game.new }

  describe ".new" do
    it "has a game window" do
      expect(game.game_window).to be_an_instance_of GameWindow
    end

    it "has an input manager" do
      expect(game.input_manager).to be_an_instance_of InputManager
    end
  end

  describe ".start" do
    it "shows the game window" do
      expect_any_instance_of(GameWindow).to receive(:show)
      game.start
    end
  end
end
