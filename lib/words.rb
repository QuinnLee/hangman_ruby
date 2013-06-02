require "random-word"

class Words
  include Enumerable
  attr_reader :word_bank
  def initialize
    @word_bank =[]
    until @word_bank.count >= 50 do
      word = RandomWord.nouns.next
      @word_bank << word unless word.include? "_"
    end
  end

  def each(&block)
    @word_bank.each(&block)
  end

  def get_word
    random_index = rand(@word_bank.size)
    get_word = @word_bank.delete_at(random_index)
    get_word.split(//)
  end

end