require_relative '../spec_helper'

describe Scene do
  let(:game_window) { GameWindow.new }
  let(:scene)       { Scene.new }

  before { Game.game_window = game_window }

  describe ".new" do
    it "has sprites" do
      expect(scene.sprites).to_not be_empty
    end
  end

  describe ".update" do
    it "updates each sprite" do
      expect(scene.sprites.first).to receive(:update)
      scene.update
    end
  end

  describe ".draw" do
    it "draw each sprite" do
      expect(scene.sprites.first).to receive(:draw)
      scene.draw
    end
  end
end
