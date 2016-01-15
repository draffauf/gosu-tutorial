require_relative '../spec_helper'

describe BoardItem do
  let(:board_item) { BoardItem.new 5, 10 }

  describe ".new" do
    it { expect(board_item.x           ).to eq 5       }
    it { expect(board_item.y           ).to eq 10      }
    it { expect(board_item.z           ).to eq 1       }
    it { expect(board_item.sprite_sheet).to eq "items" }
    it { expect(board_item.value       ).to eq 0       }
    it { expect(board_item.width       ).to eq 100     }
    it { expect(board_item.offset_y    ).to eq -10     }
  end

  describe ".draw" do
    it "calls draw on the sprites" do
      tile = double("Tile")
      board_item.stub(sprite: tile)
      expect(tile).to receive(:draw)
      board_item.draw
    end
  end

  describe ".value=" do
    it "nullifies the tile" do
      expect(board_item.value).to eq 0
      board_item.value = 1
      expect(board_item.value).to eq 1
    end
  end
end
