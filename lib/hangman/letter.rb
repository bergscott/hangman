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

  end
end
