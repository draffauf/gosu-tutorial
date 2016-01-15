require_relative '../spec_helper'

describe BoardMap do
  let(:board_map) { BoardMap.new 5, 10 }

  describe ".new" do
    it { expect(board_map.x           ).to eq 5     }
    it { expect(board_map.y           ).to eq 10    }
    it { expect(board_map.z           ).to eq 0     }
    it { expect(board_map.sprite_sheet).to eq "map" }
    it { expect(board_map.value       ).to eq 0     }
    it { expect(board_map.width       ).to eq 100   }
    it { expect(board_map.offset_y    ).to eq 0     }
  end

  describe ".draw" do
    it "calls draw on the sprites" do
      tile = double("Tile")
      board_map.stub(sprite: tile)
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
