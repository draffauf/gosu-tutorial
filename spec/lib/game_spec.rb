require_relative '../spec_helper'

describe "Game" do
  describe ".new" do
    it "returns a Game object" do
      expect(Game.new).to be_an_instance_of Game
    end
  end

  describe ".caption" do
    it "returns a default caption" do
      game = Game.new
      expect(game.caption).to eq 'Game Window Caption'
    end
  end

  describe ".draw" do
  end

  describe ".update" do
  end
end
