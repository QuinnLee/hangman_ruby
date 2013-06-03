require_relative "players"
require_relative "words"
require_relative "game"

class Runner

  def initialize
    @game = Game.new
    @players = Players.new
    get_player_names
    @players.shuffle
  end

  def is_player_count_valid?(number)
    true if number.between?(1,5)
  end

  def get_player_count
    puts "How many Players are there ?  (1-5)"
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
    if guess == '!'
      all_or_nothing(guess)
    else
      place_char(guess)
      @game.win?
    end
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
      puts "#{player} what is your guess?"
      display_remainder
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
