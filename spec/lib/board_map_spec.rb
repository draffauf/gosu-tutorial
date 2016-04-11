require 'spec_helper'

describe BoardMap do
  let(:board_map) { BoardMap.new Position.new(x: 5, y: 10, z: 0) }

  describe ".new" do
  end

  describe ".draw" do
    it "calls draw on the sprites" do
      tile = double("Tile")
      allow(board_map).to receive(:sprite).and_return(tile)
      expect(tile).to receive(:draw)
      board_map.draw
    end
  end
end
