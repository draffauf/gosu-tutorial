require_relative '../spec_helper'

describe "Game" do
  describe ".name" do
    it "returns a default name of 'Game'" do
      expect(Game.new.name).to eq 'Game'
    end
  end
end
