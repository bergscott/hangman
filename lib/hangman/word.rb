module Hangman
  class Word
    attr_accessor :letters

    def initialize(string)
      @letters = string.chars.map { |ch| Letter.new(ch) }
    end

    def display_progress
      letters.map { |letter| letter.display }.join(" ")
    end

    def reveal
      letters.map { |letter| letter.reveal }.join
    end

    def solved?
      letters.all? { |letter| letter.guessed? }
    end

    def good_guess?(guess)
      letters.any? { |letter| letter.match?(guess) }
    end

    def update(guess)
      letters.each { |letter| letter.try_guess(guess) unless letter.guessed? }
    end
  end
end
