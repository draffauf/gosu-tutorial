require 'spec_helper'

describe BoardMap do
  let(:board_map) { BoardMap.new Position.new(x: 5, y: 10, z: 0) }

  describe "#SPRITE_SHEET" do
    it { expect(described_class::SPRITE_SHEET).to eq "map" }
  end

  describe "#SPRITE_SIZE" do
    it { expect(described_class::SPRITE_SIZE).to eq 100 }
  end

  describe ".new" do
  end
end
