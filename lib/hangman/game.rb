module Hangman

  class Game
    attr_reader :word, :letters_guessed, :guesses_left

    def initialize(input={})
      @min_ch = input.fetch(:min_ch, 5)
      @max_ch = input.fetch(:max_ch, 12)
      @word = Word.new(input.fetch(:word,
                                   random_word(input.fetch(:dict_fname,
                                                           default_fname))))
      @guesses_left = input.fetch(:guesses, 6)
      @letters_guessed = []
    end

    def play
      loop do
        puts display_word
        puts display_letters_guessed
        puts display_guesses_left
        guess_letter(get_guess)
        puts #blank line
        break if lose? || win?
      end
      puts end_msg(lose? ? "lose" : "win")
    end

    private

    def random_word(fname=default_fname)
      File.open(fname, "r") do |file|
        word = ""
        words = file.readlines
        until word.length >= @min_ch && word.length <= @max_ch
          word = words.sample.strip
        end
        word
      end
    end

    def display_word
      word.display_progress
    end

    def guess_letter(guess)
      @letters_guessed << guess
      if guess_matches?(guess)
        update_word(guess)
      else
        bad_guess(guess)
      end
    end

    def guess_matches?(guess)
      word.good_guess?(guess)
    end

    def bad_guess(guess)
      puts "There are no #{guess}'s in the secret word."
      @guesses_left -= 1
    end

    def update_word(guess)
      word.update(guess)
    end

    def get_guess
      print "Guess a letter: "
      loop do
        guess = gets.chomp.downcase.strip
        return guess if valid_guess?(guess)
        print "Invalid guess, try again: "
      end
    end

    def valid_guess?(guess) 
      !guess.match(/^[a-z]$/).nil? && !letters_guessed.include?(guess)
    end

    def lose?
      guesses_left <= 0
    end

    def win?
      word.solved?
    end

    def lose
      "You lose!"
    end

    def win
      "You win!"
    end

    def end_msg(result)
      "You #{result}! The secret word was #{word.reveal}."
    end

    def display_letters_guessed
      "Letters guessed: #{letters_guessed.join(", ")}"
    end

    def display_guesses_left
      "Guesses remaining: #{guesses_left}"
    end

    def default_fname
      "5desk.txt"
    end

  end
end
