require 'spec_helper'

describe BoardPosition do
  let(:position)       { Position.new(x: 200, y: 100, z: 0) }
  let(:board_position) { BoardPosition.new position }

  describe ".new" do
    it { expect(board_position.position).to eq position }
    it { expect(board_position.open?   ).to be_truthy   }
  end

  describe ".update" do
  end

  describe ".draw" do
    context "is open" do
      it "calls draw on the Sprite" do
        draw_count = 0
        allow(board_position).to receive(:open?).and_return(true)
        allow_any_instance_of(Sprite).to receive(:draw) { draw_count += 1 }
        board_position.draw
        expect(draw_count).to eq 2
      end
    end

    context "is not open" do
      it "calls draw on the Sprite" do
        draw_count = 0
        allow(board_position).to receive(:open?).and_return(false)
        allow_any_instance_of(Sprite).to receive(:draw) { draw_count += 1 }
        board_position.draw
        expect(draw_count).to eq 1
      end
    end
  end

  describe ".occupy" do
    let(:player) { Player.new }

    it "makes the position no longer open" do
      board_position.occupy player
      expect(board_position).to_not be_open
    end
  end
end
