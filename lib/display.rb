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
        
        If at any time you'd like to save your progress,
        type SAVE instead of guessing a letter.
        
        Good luck!
        
    HEREDOC
  end
end
