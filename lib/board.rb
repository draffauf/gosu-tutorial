class Board
  TILE_SETS_PATH      = "graphics/tile_sets"
  DEFAULT_TILE_SET    = "big_tiles"
  EXTENSION           = ".png"
  TILEABLE            = true
  DEFAULT_TILE_SIZE   = 100
  SCREEN_WIDTH        = 1440
  SCREEN_HEIGHT       = 900
  BACKGROUND_OFFSET_Y = -14

  attr_reader :rows,
              :columns,
              :tile_size,
              :tiles

  def initialize rows = 5,
                 columns = 9,
                 tile_size = DEFAULT_TILE_SIZE
    @rows      = rows
    @columns   = columns
    @tile_size = tile_size
    @tiles     = build_tiles
  end

  def update
  end

  def draw
    tiles.each { |tile| tile.draw }
  end

private

  def build_tiles
    return @tiles if @tiles

    @tiles = []

    rows.times do |y|
      columns.times do |x|
        @tiles << Tile.new({
          sprite: tile_sprites[0],
          x: map_offset_x + x * tile_size,
          y: map_offset_y + y * (tile_size + BACKGROUND_OFFSET_Y),
          z: z_index
        })
      end
    end

    @tiles
  end

  def map_offset_x
    @map_offset_x ||= (1440 - columns * DEFAULT_TILE_SIZE) / 2
  end

  def map_offset_y
    @map_offset_y ||= (900 - rows * (DEFAULT_TILE_SIZE + BACKGROUND_OFFSET_Y)) / 2
  end

  def z_index
    0
  end

  def tile_sprites
    @tile_sprites ||= Gosu::Image.load_tiles Game.game_window,
                                             file_path,
                                             DEFAULT_TILE_SIZE,
                                             DEFAULT_TILE_SIZE,
                                             TILEABLE
  end

  def file_path
    @file_path ||= [
        TILE_SETS_PATH,
        DEFAULT_TILE_SET
      ].join('/') << EXTENSION
  end

  class Tile
    def initialize sprite:, x: 0, y: 0, z: 0
      @sprite = sprite
      @x = x
      @y = y
      @z = z
    end

    def draw
      sprite.draw x, y, z
    end

  private

    attr_reader :sprite, :x, :y, :z

  end

end
