require_relative 'board_sprite'

class BoardMap < BoardSprite
  private

  def z;            0     end
  def sprite_sheet; "map" end
  def value;        0     end
  def offset_y;     0     end
end
