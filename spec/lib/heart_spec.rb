require_relative '../spec_helper'

describe Heart do
  let(:heart) { Heart.new 5, 10 }

  describe ".new" do
    it { expect(heart.x           ).to eq 5        }
    it { expect(heart.y           ).to eq 10       }
    it { expect(heart.z           ).to eq 0        }
    it { expect(heart.sprite_sheet).to eq "hearts" }
    it { expect(heart.value       ).to eq 0        }
    it { expect(heart.width       ).to eq 50       }
    it { expect(heart.offset_y    ).to eq 0        }
  end

  describe ".draw" do
    it "calls draw on the sprites" do
      tile = double("Tile")
      heart.stub(sprite: tile)
      expect(tile).to receive(:draw)
      heart.draw
    end
  end

  describe ".value=" do
    it "nullifies the tile" do
      expect(heart.value).to eq 0
      heart.value = 1
      expect(heart.value).to eq 1
    end
  end
end
