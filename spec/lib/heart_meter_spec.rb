require 'spec_helper'

describe HeartMeter do
  let(:player)      { Player.new }
  let(:heart_meter) { HeartMeter.new player }

  describe ".update" do
    it "updates the heart meter with new values from the player" do
      allow(player).to receive(:max_health).and_return(player.max_health + 1)
      allow(player).to receive(:health    ).and_return(player.health     + 1)
      heart_meter.update
      expect(heart_meter.send(:max_health)).to eq 6
      expect(heart_meter.send(:health)    ).to eq 4
    end
  end

  describe ".draw" do
    it "renders the hearts in the meter" do
      heart = double("Heart")
      allow(heart_meter).to receive(:hearts).and_return([heart])
      expect(heart).to receive(:draw)
      heart_meter.draw
    end
  end
end
