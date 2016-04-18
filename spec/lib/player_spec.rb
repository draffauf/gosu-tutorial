require 'spec_helper'

describe Player do
  let(:player) { Player.new  }

  describe ".new" do
    it { expect(player.health    ).to eq 3 }
    it { expect(player.max_health).to eq 5 }
    it { expect(player.experience).to eq 0 }
    it { expect(player.next_level).to eq 3 }
    it { expect(player.position).to be_kind_of(Position) }
    it { expect(player.board_position).to be_nil }
  end
end
