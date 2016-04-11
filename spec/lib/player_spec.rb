require 'spec_helper'

describe Player do
  let(:position) { Position.new x: 0, y: 2 }
  let(:player)   { Player.new position }

  describe ".new" do
    it { expect(player.health    ).to eq 3 }
    it { expect(player.max_health).to eq 5 }
    it { expect(player.experience).to eq 0 }
    it { expect(player.next_level).to eq 3 }
    it { expect(player.position).to eq position }
  end
end
