require_relative '../spec_helper'

describe BoardPosition do
  let(:board_position) { BoardPosition.new 200, 100 }

  describe ".new" do
    it { expect(board_position.x).to eq 200 }
    it { expect(board_position.y).to eq 100 }
  end

  describe ".update" do
  end

  describe ".draw" do
    it "calls draw on the BoardSprite" do
      expect_any_instance_of(BoardSprite).to receive(:draw)
      board_position.draw
    end
  end
end
