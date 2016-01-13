require_relative '../spec_helper'

describe BoardSprite do
  let(:board_sprite) { BoardSprite.new 5, 10 }

  describe ".new" do
    it { expect(board_sprite.x).to eq 5  }
    it { expect(board_sprite.y).to eq 10 }
  end

  describe ".draw" do
    it "calls draw on the sprites" do
      expect_any_instance_of(Tile).to receive(:draw)
      board_sprite.draw
    end
  end
end
