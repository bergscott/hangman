module Hangman
  class Letter
    attr_accessor :value, :guessed

    def initialize(value)
      @value = value.downcase
      @guessed = false
    end

    def display
      guessed ? value : "_"
    end

    def reveal
      value
    end

    def try_guess(guess)
      @guessed = true if match?(guess)
    end

    def match?(guess)
      value == guess
    end

    def guessed?
      guessed
    end

  end
end
