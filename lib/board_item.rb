require_relative 'board_sprite'

class BoardItem < BoardSprite
  private

  def z;            1        end
  def sprite_sheet; "items"  end
  def value;        0        end
  def offset_y;     -9       end
end
