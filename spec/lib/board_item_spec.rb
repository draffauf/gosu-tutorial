require 'spec_helper'

describe BoardItem do
  let(:position)   { Position.new(x: 5, y: 10, z: 1) }
  let(:board_item) { BoardItem.new position }

  describe ".new" do
    it { expect(board_item.position    ).to eq position }
  end

  describe ".draw" do
    it "calls draw on the sprites" do
      tile = double("Tile")
      allow(board_item).to receive(:sprite).and_return(tile)
      expect(tile).to receive(:draw)
      board_item.draw
    end
  end
end
