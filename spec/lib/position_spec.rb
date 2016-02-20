require 'spec_helper'

describe Position do
  let(:position)        { Position.new }
  let(:custom_position) { Position.new(x: 1, y: 2, z: 3) }
  let(:delta_position)  { Position.new(x: 1, y: 1, z: 1) }

  describe ".new" do
    context "with defaults" do
      it { expect(position.x).to eq 0 }
      it { expect(position.y).to eq 0 }
      it { expect(position.z).to eq 0 }
    end

    context "with custom values" do
      it { expect(custom_position.x).to eq 1 }
      it { expect(custom_position.y).to eq 2 }
      it { expect(custom_position.z).to eq 3 }
    end
  end

  describe ".+" do
    let (:positon) { custom_position + delta_position }

    it { expect(positon.x).to eq 2 }
    it { expect(positon.y).to eq 3 }
    it { expect(positon.z).to eq 4 }
  end
end
