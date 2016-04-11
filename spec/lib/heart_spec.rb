require 'spec_helper'

describe Heart do
  let(:position) { Position.new(x: 5, y: 10, z: 0) }
  let(:heart)    { Heart.new position }

  describe ".new" do
    it { expect(heart.position    ).to eq position }
    it { expect(heart.sprite_sheet).to eq "hearts" }
    it { expect(heart.value       ).to eq 0        }
    it { expect(heart.width       ).to eq 50       }
  end

  describe ".draw" do
    it "calls draw on the sprites" do
      tile = double("Tile")
      allow(heart).to receive(:sprite).and_return(tile)
      expect(tile).to receive(:draw)
      heart.draw
    end
  end

  describe ".value=" do
    it "nullifies the tile" do
      expect(heart.value).to eq 0
      heart.value = 1
      expect(heart.value).to eq 1
    end
  end
end
