require "random-word"

class WordBank
  include Enumerable
  attr_reader :words
  
  def initialize
    @words =[]
    
    until @words.count >= 50 do
      word = RandomWord.nouns.next
      @words << word unless word.include? "_"
    end
  end

  def each(&block)
    @words.each(&block)
  end

  def get_word
   random_index = rand(@words.size)
   get_word = @words.delete_at(random_index)
  end

end
