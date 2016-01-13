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
  end
end
