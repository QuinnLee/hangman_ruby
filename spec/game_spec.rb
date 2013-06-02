require "spec_helper"
require "pry"

describe Game do
  let(:game){Game.new}
  describe "#check_player_count" do
    it "checks to if number is between 1 and 5" do
      5.times do |number|
        number +=1
        expect(game.check_player_count(number)).to be_true
      end
    end
    it "returns false if a number is not 1 - 5" do
      bad_numbers = [0,-1,6,7]
      bad_numbers.each do |number|
        expect(game.check_player_count(number)).to be_false
      end
    end
  end

  describe "#set_player_name" do
    let(:test_name){"Bob"}
    before :each do
      game.set_player_name(test_name)
    end

    it "adds a name to the player element" do
      game.players.each do |name|
        expect(name).to eql(test_name)
      end 
    end
  end

  describe "#check_player_name" do
    let(:test_name){"Bob"}
    before :each do
      game.set_player_name(test_name)
    end

    it "returns true if a name is not on the list" do
      expect(game.check_player_name(test_name)).to be_false
    end
    it "returns false if a name is  in the list" do
      expect(game.check_player_name("Dan")).to be_true
    end
  end

  describe "#get_word" do
    it "gets a word from the bank" do
      test_word = game.get_word
      expect(test_word).to be_an_instance_of(Array)
    end
  end

  describe "#set_unique_chars" do
    before :each do
      game.get_word
    end
    it "gets the unique chars from a word" do
      word = game.current_word
      unique_chars = word.uniq
      expect(game.set_unique_chars).to eql(unique_chars)
    end
  end

  describe "#set_display_word" do
    before :each do
      game.get_word
    end
    it "makes an empty array same size as current_word" do
      size = game.current_word.size
      game. set_display_word
      expect(size).to eql game.display_word.size
    end
  end

   describe "#check_guess" do
    before :each do
      game.get_word
    end
    it "returns true if" do
      unique_chars = word.uniq
    end
  end

end