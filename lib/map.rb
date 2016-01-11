class Map
  SCREEN_WIDTH  = 1440 #TODO MOVE
  SCREEN_HEIGHT = 900  #TODO MOVE
  TILE_OFFSET_Y = 14

  attr_reader :tile_set,
              :tile_size,
              :tiles,
              :map_offset_y,
              :z_index,
              :columns,
              :rows

  def initialize tile_set = TileSet.new,
                 map_offset_y = 0,
                 z_index = 0
    @tile_set     = tile_set
    @map_offset_y = map_offset_y
    @z_index      = z_index
    @columns      = 10
    @rows         = 5
  end

  def update
  end

  def draw
    tiles.each { |tile| tile.draw }
  end

private

  def tile_size
    @tile_size ||= tile_set.tile_size
  end

  def tiles
    @tiles ||= [].tap do |the_tiles|
      rows.times do |row|
        columns.times do |column|
          the_tiles << Tile.new({
            sprite: value,
            x:      offset_x + column * tile_size,
            y:      offset_y + row * tile_size - (row * TILE_OFFSET_Y),
            z:      z_index
          })
        end
      end
    end
  end

  def value
    # We can do something smarter here when we have more tiles,
    # Like construct an actual level map (2D array?) with real tile values
    tile_set.tiles[0]
  end

  def offset_x
    @offset_x ||= (SCREEN_WIDTH - columns * tile_size) / 2
  end

  def offset_y
    @offset_y ||= (SCREEN_HEIGHT - rows * (tile_size - TILE_OFFSET_Y)) / 2 + map_offset_y
  end
end

class TileMap < Map
end

class ItemMap < Map
  def initialize
    super TileSet.new("item"), -10
  end

  def value
    index = rand(2)
    tile_set.tiles[index]
  end
end
