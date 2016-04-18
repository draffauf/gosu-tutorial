require 'spec_helper'

describe Scene do
  let(:game_window) { GameWindow.new }
  let(:scene)       { Scene.new }
  let(:player)      { Player.new }
  let(:board)       { Board.new }
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

    it "calls board.move(player)" do
      expect(board).to receive(:move).with(player: player)
      Scene.new board:  board,
                player: player
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
      allow(scene).to receive(:sprites).and_return([sprite])
      expect(scene.sprites.first).to receive(:draw)
      scene.draw
    end
  end
end
