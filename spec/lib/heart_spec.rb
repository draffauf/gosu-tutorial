require 'spec_helper'

describe Heart do
  let(:position) { Position.new(x: 5, y: 10, z: 0) }
  let(:player)   { Player.new }
  let(:heart) do
    Heart.new position: position,
              count: 0,
              player: player
  end

  describe "constants" do
    it { expect(described_class::SPRITE_SHEET ).not_to be_nil }
    it { expect(described_class::SPRITE_SIZE  ).not_to be_nil }
    it { expect(described_class::Z_INDEX      ).not_to be_nil }
    it { expect(described_class::STATES       ).not_to be_nil }
  end

  describe ".new" do
    it { expect(heart.position ).to eq position }
  end
end
