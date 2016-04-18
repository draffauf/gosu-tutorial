require 'spec_helper'

describe BoardPosition do
  let(:position)       { Position.new(x: 200, y: 100, z: 0) }
  let(:item)           { Item::Health.new }
  let(:board_position) { BoardPosition.new(position: position, starting_item: item) }

  describe ".new" do
    it { expect(board_position.position).to eq position }
    it { expect(board_position.open?   ).to be_truthy   }
  end

  describe ".update" do
  end

  describe ".draw" do
    it "calls draw on the Sprite" do
      draw_count = 0
      allow_any_instance_of(Sprite).to receive(:draw) { draw_count += 1 }
      expect(board_position.item).not_to be_nil
      board_position.draw
      expect(draw_count).to eq 2
    end
  end
end
