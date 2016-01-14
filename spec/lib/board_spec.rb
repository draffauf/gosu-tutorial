require_relative '../spec_helper'

describe Board do
  let(:board)       { Board.new }
  let(:game_window) { GameWindow.new }

  describe "Board attributes" do
    it { expect(Board::SCREEN_WIDTH       ).to eq 1440 } #TODO MOVE
    it { expect(Board::SCREEN_HEIGHT      ).to eq 900  } #TODO MOVE
    it { expect(Board::BACKGROUND_OFFSET_Y).to eq -14  }
  end

  describe ".new" do
    before { Game.game_window = game_window }
    it { expect(board.rows      ).to eq 5   }
    it { expect(board.columns   ).to eq 9   }
    it { expect(board.tile_size ).to eq 100 }
  end

  describe ".draw" do
    it "calls draw on the BoardSprite" do
      draw_count = 0
      allow_any_instance_of(BoardPosition).to receive(:draw) { draw_count += 1 }
      board.draw
      expect(draw_count).to eq 45
    end
  end

  describe ".position" do
    before { Game.game_window = game_window }

    context "within bounds" do
      it "returns a BoardPosition" do
        expect(board.position(0,0)).to be_instance_of(BoardPosition)
        expect(board.position(2,5)).to be_instance_of(BoardPosition)
        expect(board.position(4,8)).to be_instance_of(BoardPosition)
      end
    end

    context "out of bounds" do
      it "returns a NullBoardPosition" do
        expect(board.position(-1, 0)).to be_instance_of(NullBoardPosition)
        expect(board.position( 5, 0)).to be_instance_of(NullBoardPosition)
        expect(board.position(0, -1)).to be_instance_of(NullBoardPosition)
        expect(board.position(0,  9)).to be_instance_of(NullBoardPosition)
      end
    end
  end
end
