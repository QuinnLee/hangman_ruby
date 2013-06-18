class Game
  attr_reader :word, :game_word, :display_word, :game_over

  def initialize(word)
    @word = word
    start
  end

  def set_game_word
    @game_word = @word.split(//)
  end

  def set_display_word
    @display_word = Array.new(@game_word.size)
    @display_word.map! { |e| "_" }
  end

  def compare_string(guess)
    @game_over = true if guess.downcase.eql? @word
  end

  def compare_char(char)
    true if @game_word.include? char
  end

  def place_char(char)
    @game_word.each_index do |index|
      @display_word[index] = char if @game_word[index] == char
    end
  end

  def return_display_word
    @display_word.join (" ")
  end

  def win?
    @game_over = true if @game_word == @display_word
  end

  def start
    @game_over = false
    set_game_word
    set_display_word
  end
end

