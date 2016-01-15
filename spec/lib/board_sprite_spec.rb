require_relative '../spec_helper'

describe BoardSprite do
  let(:board_sprite) { BoardSprite.new 5, 10 }

  describe ".new" do
    it { expect(board_sprite.x           ).to eq 5     }
    it { expect(board_sprite.y           ).to eq 10    }
    it { expect(board_sprite.z           ).to eq 0     }
    it { expect(board_sprite.sprite_sheet).to eq "map" }
    it { expect(board_sprite.value       ).to eq 0     }
    it { expect(board_sprite.width       ).to eq 100   }
    it { expect(board_sprite.offset_y    ).to eq 0     }
  end

  describe ".draw" do
    it "calls draw on the sprites" do
      tile = double("Tile")
      board_sprite.stub(sprite: tile)
      expect(tile).to receive(:draw)
      board_sprite.draw
    end
  end

  describe ".value=" do
    it "nullifies the tile" do
      expect(board_sprite.value).to eq 0
      board_sprite.value = 1
      expect(board_sprite.value).to eq 1
    end
  end
end
