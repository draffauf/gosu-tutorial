require 'spec_helper'

describe Sprite do
  let(:position) { Position.new(x: 5, y: 10, z: 0) }
  let(:sprite)   { Sprite.new position }

  describe ".new" do
    it { expect(sprite.position    ).to eq position }
    it { expect(sprite.sprite_sheet).to eq "map"    }
    it { expect(sprite.value       ).to eq 0        }
    it { expect(sprite.width       ).to eq 100      }
    it { expect(sprite.offset_y    ).to eq 0        }
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
