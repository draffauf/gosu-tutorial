require_relative '../spec_helper'

describe Map do
  let(:map) { Map.new }

  describe "Map attributes" do
    it { expect(Map::TILE_SETS_PATH   ).to eq "graphics/tile_sets" }
    it { expect(Map::DEFAULT_TILE_SET ).to eq "tile_set" }
    it { expect(Map::EXTENSION        ).to eq ".png" }
    it { expect(Map::TILEABLE         ).to eq true }
    it { expect(Map::DEFAULT_TILE_SIZE).to eq 32 }
  end

  describe ".draw" do
    it "draw the tiles" do
      expect(map.tiles.first).to receive(:draw)
      map.draw
    end
  end
end
