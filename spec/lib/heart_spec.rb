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
end
