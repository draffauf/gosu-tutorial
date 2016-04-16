require 'spec_helper'

describe BoardItem do
  let(:position)   { Position.new(x: 5, y: 10, z: 1) }
  let(:board_item) { BoardItem.new position }

  describe "#SPRITE_SHEET" do
    it { expect(described_class::SPRITE_SHEET).to eq "items" }
  end

  describe "#SPRITE_SIZE" do
    it { expect(described_class::SPRITE_SIZE).to eq 100 }
  end

  describe ".new" do
    it { expect(board_item.position    ).to eq position }
  end
end
