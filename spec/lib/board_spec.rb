require_relative '../spec_helper'

describe Board do
  let(:board)       { Board.new }
  let(:game_window) { GameWindow.new }

  describe "Board attributes" do
    it { expect(Board::TILE_SETS_PATH     ).to eq "graphics/tile_sets" }
    it { expect(Board::DEFAULT_TILE_SET   ).to eq "big_tiles"          }
    it { expect(Board::EXTENSION          ).to eq ".png"               }
    it { expect(Board::TILEABLE           ).to eq true                 }
    it { expect(Board::DEFAULT_TILE_SIZE  ).to eq 100                  }
    it { expect(Board::SCREEN_WIDTH       ).to eq 1440                 } #TODO MOVE
    it { expect(Board::SCREEN_HEIGHT      ).to eq 900                  } #TODO MOVE
    it { expect(Board::BACKGROUND_OFFSET_Y).to eq -14                  }
  end

  describe ".new" do
    before { Game.game_window = game_window }
    it { expect(board.rows      ).to eq 5   }
    it { expect(board.columns   ).to eq 9   }
    it { expect(board.tile_size ).to eq 100 }
    it { expect(board.tiles.size).to eq 45  }
  end

  describe ".tile_size" do
    it "has a tile size" do
      board = Board.new(0, 0, Board::DEFAULT_TILE_SIZE + 10)
      expect(board.tile_size).to eq(Board::DEFAULT_TILE_SIZE + 10)
    end
  end

end
