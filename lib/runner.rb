require_relative "players"
require_relative "word_bank"
require_relative "game"
class Runner

  def initialize
    @word_bank = WordBank.new
    @game = Game.new(@word_bank.get_word)
    @players = Players.new
    get_player_names
    @players.shuffle
  end

  def is_player_count_valid?(number)
    number.between?(1,5)
  end

  def get_player_count
    puts "How many Players are there?  (1-5)"
    number = gets.chomp.to_i
    unless is_player_count_valid?(number)
      puts "INVALID NUMBER"
      get_player_count
    end
    number
  end

  def get_a_player_name(place)
    puts "what is player's #{place+1} name"
    name = gets.chomp
    if @players.check_name(name)
      @players.add_name(name)
    else
      puts "INVALID NAME"
      get_a_player_name
    end
  end

  def get_player_names
    number = get_player_count
    number.times do |place|
      get_a_player_name(place)
    end
  end

  def ask_for_a_char
    puts "Guess a character or type ! to guess!!"
    guess = gets.chomp

    if already_guessed?(guess)
      puts "Already guessed noob"
      ask_for_a_char
    end

    if guess == '!'
      all_or_nothing(guess)
    elsif guess.length  == 1 
      place_char(guess)
      @game.win?
    else
      puts "NOT A CHAR"
      ask_for_a_char
    end
    display_remainder
  end

  def already_guessed?(guess)
    @game.used_words.include?(guess)
  end

  def all_or_nothing(guess)
    puts "ALL OR NOTHING!!!! WHAT IS THE ANSWER!!!"
    guess = gets.chomp
    @game.compare_string(guess)
  end

  def place_char(char)
    if @game.compare_char(char)
      puts "NICE"
    else
      puts "FAIL"
    end 
    @game.place_char(char)  
  end

  def display_remainder
    puts @game.return_display_word
  end

  def one_round
    @players.each do |player|
      puts " "
      puts "****************************"
      puts "#{player} what is your guess?"
      ask_for_a_char
      if @game.game_over
        puts "The word is: #{@game.word}"
        puts "#{player} has won!"
        break
      end
    end
  end

  def play
    one_round
    play unless @game.game_over
  end

end

test = Runner.new
test.play
