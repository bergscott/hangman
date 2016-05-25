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
  end
end
