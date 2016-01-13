require_relative '../spec_helper'

describe BoardSprite do
  it { expect(BoardSprite::TILE_SETS_PATH     ).to eq "graphics/tile_sets" }
  it { expect(BoardSprite::DEFAULT_TILE_SET   ).to eq "big_tiles"          }
  it { expect(BoardSprite::EXTENSION          ).to eq ".png"               }
  it { expect(BoardSprite::TILEABLE           ).to eq true                 }
  it { expect(BoardSprite::DEFAULT_TILE_SIZE  ).to eq 100                  }
  it { expect(BoardSprite::Z_INDEX            ).to eq 0                    }

  let(:board_sprite) { BoardSprite.new 5, 10 }

  describe ".new" do
    it { expect(board_sprite.x).to eq 5  }
    it { expect(board_sprite.y).to eq 10 }
  end

  describe "" do
  end
end
