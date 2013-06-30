require "spec_helper"

describe Game do
  let(:game) { Game.new("hello") }
  describe "#new" do
    it "sets game_word" do
      display = game.game_word
      expect(display).to be_an_instance_of(Array)
      string = display.join
      expect(string).to eql(game.word)
    end
    it "sets a display word" do
      display_length = game.game_word.size
      expect(game.display_word.size).to eql display_length
    end
  end

  describe "#compare_string" do
    it "returns true if the argument equals" do
      test_word = game.word.dup
      game.compare_string(test_word)
      expect(game.game_over).to be_true
    end
  end

  describe "#compare_char" do
    it "returns true if char is in the string" do
      char = game.game_word[1]
      expect(game.compare_char(char)).to be_true
    end
    it "returns false if char is not in the string" do
      char = 0
      expect(game.compare_char(char)).to be_false
    end
  end

  describe "#place_char" do
    it "places a char in the show holder" do
      test = game.game_word

      test.each do |char|
        game.place_char(char)
      end
      expect(game.display_word).to eql game.game_word
    end
  end
end
