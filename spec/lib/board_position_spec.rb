require_relative '../spec_helper'

describe BoardPosition do
  let(:board_position) { BoardPosition.new 200, 100 }

  it { expect(BoardPosition::TILE_SETS_PATH     ).to eq "graphics/tile_sets" }
  it { expect(BoardPosition::DEFAULT_TILE_SET   ).to eq "big_tiles"          }
  it { expect(BoardPosition::EXTENSION          ).to eq ".png"               }
  it { expect(BoardPosition::TILEABLE           ).to eq true                 }
  it { expect(BoardPosition::DEFAULT_TILE_SIZE  ).to eq 100                  }
  it { expect(BoardPosition::Z_INDEX            ).to eq 0                    }

  describe ".new" do
    it { expect(board_position.x).to eq 200 }
    it { expect(board_position.y).to eq 100 }
  end

  describe ".update" do
  end

  describe ".draw" do
  end
end
