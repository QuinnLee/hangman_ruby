require "spec_helper"

describe Words do
  let(:words){Words.new}
  describe "#new" do
    it "generates a list of 50 words" do
      word_bank = words.word_bank
      expect(word_bank).to be_an_instance_of(Array)

      word_bank.each do |word|
        expect(word).to be_an_instance_of(String)
      end
    end
  end

  describe "#get_word" do
    it "removes one word from the word bank" do
      count = words.dup.count
      words.get_word
      expect(words.count).to eql(count-1)
    end
    it "returns an array of characters"do
      array_of_char = words.get_word
      expect(array_of_char).to be_an_instance_of(String)
    end
  end

end