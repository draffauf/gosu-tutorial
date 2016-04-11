require 'spec_helper'

describe Heart do
  let(:position) { Position.new(x: 5, y: 10, z: 0) }
  let(:heart)    { Heart.new position }

  describe "#SPRITE_SHEET" do
    it { expect(described_class::SPRITE_SHEET).to eq "hearts" }
  end

  describe "#SPRITE_SIZE" do
    it { expect(described_class::SPRITE_SIZE).to eq 50 }
  end

  describe ".new" do
    it { expect(heart.position    ).to eq position }
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
    let(:tile) { 1 }

    it "delegates to sprite" do
      expect(heart.sprite).to receive(:value=).with(tile)
      heart.value = tile
    end
  end
end
