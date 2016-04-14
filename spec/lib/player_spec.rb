require 'spec_helper'

describe Player do
  let(:position)       { Position.new }
  let(:board_position) { Position.new x: 0, y: 2, z: 2 }
  let(:player)         { Player.new board_position }

  describe ".new" do
    it { expect(player.health    ).to eq 3 }
    it { expect(player.max_health).to eq 5 }
    it { expect(player.experience).to eq 0 }
    it { expect(player.next_level).to eq 3 }
    it { expect(player.position).to be_kind_of(Position) }
    it { expect(player.board_position).to be_kind_of(Position) }
  end
end
