require 'spec_helper'

describe Item::Damage do
  let(:position) { Position.new }
  let(:player)   { Player.new }
  let(:item)     { described_class.new(position: position) }

  describe "constants" do
    it { expect(described_class::SPRITE_SHEET).to be_kind_of(String)  }
    it { expect(described_class::SPRITE_SIZE ).to be_kind_of(Integer) }
    it { expect(described_class::Z_INDEX     ).to be_kind_of(Integer) }
    it { expect(described_class::Y_OFFSET    ).to be_kind_of(Integer) }
  end

  describe ".new" do
    it { expect(item.position).to eq position }
  end

  describe ".sprite_value" do
    it { expect(item.sprite_value).to eq 1 }
  end

  describe ".interact" do
    it "reduces the player's health by 1" do
      expect{ item.interact(player) }.to change{ player.health }.by(-1)
    end
  end
end
