require "spec_helper"

describe WordBank do
  let(:word_bank){ WordBank.new }

  describe "#new" do
    it "has a list of 50 words" do
      words = word_bank.words
      expect(words.count).to eq 50
    end
  end

  describe "#get_word" do
    it "removes one word from the word bank" do
      count = word_bank.dup.count
      word_bank.get_word
      expect(word_bank.count).to eql(count-1)
    end
    it "returns an array of characters"do
      array_of_char = word_bank.get_word
      expect(array_of_char).to be_an_instance_of(String)
    end
  end
end
