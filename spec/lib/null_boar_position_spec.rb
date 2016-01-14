require_relative '../spec_helper'

describe NullBoardPosition do
  let(:null_board_position) { NullBoardPosition.new }

  describe ".open?" do
    it { expect(null_board_position.open?).to be_falsey }
  end
end
