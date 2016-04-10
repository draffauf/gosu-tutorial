require 'spec_helper'

describe Sprite do
  let(:sprite) { Sprite.new 5, 10 }

  describe ".new" do
    it { expect(sprite.x           ).to eq 5     }
    it { expect(sprite.y           ).to eq 10    }
    it { expect(sprite.z           ).to eq 0     }
    it { expect(sprite.sprite_sheet).to eq "map" }
    it { expect(sprite.value       ).to eq 0     }
    it { expect(sprite.width       ).to eq 100   }
    it { expect(sprite.offset_y    ).to eq 0     }
  end

  describe ".draw" do
    it "calls draw on the sprites" do
      tile = double("Tile")
      allow(sprite).to receive(:sprite).and_return(tile)
      expect(tile).to receive(:draw)
      sprite.draw
    end
  end

  describe ".value=" do
    it "nullifies the tile" do
      expect(sprite.value).to eq 0
      sprite.value = 1
      expect(sprite.value).to eq 1
    end
  end
end
