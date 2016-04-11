require 'spec_helper'

describe BoardMap do
  let(:board_map) { BoardMap.new Position.new(x: 5, y: 10, z: 0) }

  describe ".new" do
    it { expect(board_map.sprite_sheet).to eq "map" }
    it { expect(board_map.value       ).to eq 0     }
    it { expect(board_map.width       ).to eq 100   }
    it { expect(board_map.offset_y    ).to eq 0     }
  end

  describe ".draw" do
    it "calls draw on the sprites" do
      tile = double("Tile")
      allow(board_map).to receive(:sprite).and_return(tile)
      expect(tile).to receive(:draw)
      board_map.draw
    end
  end

  describe ".value=" do
    it "nullifies the tile" do
      expect(board_map.value).to eq 0
      board_map.value = 1
      expect(board_map.value).to eq 1
    end
  end
end
