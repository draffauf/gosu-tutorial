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

  describe ".tile_size" do
    it "has a tile size" do
      map = Map.new(Map::DEFAULT_TILE_SIZE + 10)
      expect(map.tile_size).to eq(Map::DEFAULT_TILE_SIZE + 10)
    end
  end

  describe ".draw" do
    it "draw the tiles" do
      expect(map).to receive(:draw_tile).exactly(50).times
      map.draw
    end
  end
end
