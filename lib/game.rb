require_relative "players"
require_relative "words"

class Game
  attr_reader :words, :players, :current_word
  attr_reader :display_word

  def initialize
    @words = Words.new
    @players = Players.new
  end

  def check_player_count(number)
    if number.between?(1,5)
      true
    else
      puts "Number is invalid"
      false
    end
  end

  def check_player_name(name)
    if @players.include?(name)
      puts "#{name} is taken, please repick"
      false
    else
      true
    end
  end

  def set_player_name(name)
    @players.add_names(name)
  end

  def get_word
    @current_word = @words.get_word
  end

  def set_display_word
    size = @current_word.size
    @display_word = Array.new(size)
  end

  def set_number
    puts "How many players are in the game ? (1-5): "
    number = gets.chomp.to_i
    set_number unless check_player_count(number)
    return number
  end

  def set_one_player
    puts "What is the player's name"
    name = gets.chomp.downcase
    set_one_player unless check_player_name(name)
    return name
  end

  def set_players
    number_of_players = set_number
    number_of_players.times do
      set_player_name(set_one_player)
    end
  end

  def set_guess
    puts "guess a letter"
    letter = gets.chomp
    if letter.size >1
      puts "too long"
      set_guess
    end
    return letter.downcase
  end

  def check_guess(guess)
    if @current_word.include?(guess)
      true
    else
      false
  end

  def 

end

