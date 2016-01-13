require_relative '../spec_helper'

describe TileSet do
  it { expect(TileSet::EXTENSION     ).to eq "png"                    }
  it { expect(TileSet::TILE_SETS_PATH).to eq "graphics/sprite_sheets" }
  it { expect(TileSet::TILE_SET      ).to eq "map"                    }
  it { expect(TileSet::TILEABLE      ).to eq true                     }
  it { expect(TileSet::TILE_SIZE     ).to eq 100                      }

  let(:tile_set)    { TileSet.new    }
  let(:game_window) { GameWindow.new }

  describe ".new" do
    it { expect(tile_set.tile_set ).to eq "map" }
    it { expect(tile_set.tile_size).to eq 100   }
  end

  describe ".tiles" do
    before { Game.game_window = game_window }
    it { expect(tile_set.tiles.size).to eq 1 }
  end
end
