require_relative '../spec_helper'

describe BoardPosition do
  let(:board_position) { BoardPosition.new 200, 100 }

  describe ".new" do
    it { expect(board_position.x    ).to eq 200    }
    it { expect(board_position.y    ).to eq 100    }
    it { expect(board_position.open?).to be_truthy }
  end

  describe ".update" do
  end

  describe ".draw" do
    context "is open" do
      it "calls draw on the BoardSprite" do
        draw_count = 0
        board_position.stub(:open?) { true }
        allow_any_instance_of(BoardSprite).to receive(:draw) { draw_count += 1 }
        board_position.draw
        expect(draw_count).to eq 2
      end
    end

    context "is not open" do
      it "calls draw on the BoardSprite" do
        draw_count = 0
        board_position.stub(:open?) { false }
        allow_any_instance_of(BoardSprite).to receive(:draw) { draw_count += 1 }
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
