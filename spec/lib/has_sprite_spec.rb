require 'spec_helper'

describe HasSprite do
  class DummyClass
    SPRITE_SHEET = "my_sprite_sheet"
    SPRITE_SIZE  = 100

    def position; Position.new; end

    include HasSprite
  end

  let(:subject) { DummyClass.new }
  let(:sprite)  { sprite = double("Sprite") }

  describe "::SPRITE_SHEET" do
    it "is my_sprite_sheet" do
      expect(DummyClass::SPRITE_SHEET).to eq "my_sprite_sheet"
    end
  end

  describe "::SPRITE_SIZE" do
    it "is 100" do
      expect(DummyClass::SPRITE_SIZE).to eq 100
    end
  end

  describe ".sprite" do
    let(:position) { Position.mew }

    it "calls draw on the sprites" do
      expect(subject.sprite).to be_kind_of(Sprite)
    end
  end

  describe ".draw" do
    before { allow(subject).to receive(:sprite).and_return(sprite) }

    it "calls draw on the sprites" do
      expect(sprite).to receive(:draw)
      subject.draw
    end
  end

  describe ".value=" do
    let(:frame) { 1 }

    before { allow(subject).to receive(:sprite).and_return(sprite) }

    it "delegates to sprite" do
      expect(sprite).to receive(:value=).with(frame)
      subject.value = frame
    end
  end

end
