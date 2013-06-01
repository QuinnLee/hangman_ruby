require "spec_helper"

describe Game do 
  let(:game){Game.new}
  describe "#player_count" do
    it "is a integer between 1-5" do
      range = [1,2,3,4,5]
      expect(range).to include game.player_count
    end
  end
end