require_relative '../spec_helper'

describe Scene do
  let(:game_window) { GameWindow.new }
  let(:scene)       { Scene.new }
  let(:player)      { Player.new }
  let(:keys)        { {
                      left:  Gosu::KbLeft,
                      right: Gosu::KbRight,
                      up:    Gosu::KbUp,
                      down:  Gosu::KbDown
                    } }

  before { Game.game_window = game_window }

  describe ".new" do
    it "has sprites" do
      expect(scene.sprites).to_not be_empty
    end

    it "calls move_player" do
      expect_any_instance_of(Scene).to receive(:move_player).with(2, 0)
      Scene.new
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
      sprite = double("Player")
      scene.stub(sprites: [sprite])
      expect(scene.sprites.first).to receive(:draw)
      scene.draw
    end
  end
end
