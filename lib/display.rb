# frozen_string_literal: true

# controls display of letters and dashes
# displays welcome message/instructions
class Display
  attr_reader :progress

  def initialize(dictionary)
    @dictionary = dictionary
    dashes = @dictionary.winning_word.length
    @progress = Array.new(dashes) { +'_' }
  end

  def show
    puts
    print 'word --> '
    progress.each { |place| print "#{place} ".colorize(:green) }
    puts
  end

  def self.show_welcome_message
    puts <<-HEREDOC

        Welcome to Hangman!

        A secret word has been generated at random.
        Try to guess the letters of the secret word.
        You may guess the entire word at any time.
        If a letter guess is correct, 
        game will show where that letter occurs in the word.
        You will only have a few tries before the man is hanged!
        
        Enter [3] to save or [4] to exit at any time instead of guessing.
        
        Good luck!
        
    HEREDOC
  end

  def show_win_message
    puts "\n* You win! *\n".colorize(:magenta)
    puts "Winning word: #{@dictionary.winning_word.colorize(:green)}"
    Game.prompt_to_play_again
  end

  def show_lose_message
    puts "\n* Sorry, you lose. *\n".colorize(:magenta)
    puts "Winning word: #{@dictionary.winning_word.colorize(:green)}"
    Game.prompt_to_play_again
  end
end
