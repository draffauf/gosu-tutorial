class BoardSprite
  attr_accessor :x, :y, :z

  def initialize x, y
    @x = x
    @y = y + offset_y
    @z = z_index
  end

  def sprite_sheet; "map" end
  def z_index;      0     end
  def offset_y;     0     end
  def value;        0     end

  def draw
    tile.draw x, y, z
  end

  private

  def tile
    @tile ||= tiles[value]
  end

  def tiles
    @tiles ||= TileSet.new(sprite_sheet).tiles
  end
end

class BoardItem < BoardSprite
  def sprite_sheet; "item"  end
  def z_index;      1       end
  def offset_y;     -9      end

  def value
    rand(2)
  end
end

class BoardBackground < BoardSprite
  def sprite_sheet; "map"   end
  def z_index;      0       end
  def offset_y;     0       end

  def value
    0
  end
end
