require 'spec_helper'

describe Item::Base do
  let(:position)  { Position.new }
  let(:player)    { Player.new }
  let(:item)      { described_class.new(position: position) }
  let(:exception) { Exception.new('not implemented') }

  describe "constants" do
    it { expect(described_class::SPRITE_SHEET).to be_kind_of(String)  }
    it { expect(described_class::SPRITE_SIZE ).to be_kind_of(Integer) }
    it { expect(described_class::Z_INDEX     ).to be_kind_of(Integer) }
    it { expect(described_class::Y_OFFSET    ).to be_kind_of(Integer) }
  end

  describe "#random_item" do
    it { expect(described_class.random_item).to be_kind_of(Class)}
  end

  describe ".new" do
    it { expect(item.position).to eq position }
  end

  describe ".sprite_value" do
    it { expect(item.sprite_value).to be_kind_of(Integer) }
  end

  describe ".interact" do
    it { expect{ item.interact(player) }.
      to raise_exception(Exception, /not implemented/) }
  end
end
