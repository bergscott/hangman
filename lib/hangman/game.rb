module Hangman

  class Game
    attr_reader :word

    def initialize(input={})
      @min_ch = input.fetch(:min_ch, 5)
      @max_ch = input.fetch(:max_ch, 12)
      @word = Word.new(input.fetch(:word,
                                   random_word(input.fetch(:dict_fname,
                                                           default_fname))))
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

    def default_fname
      "5desk.txt"
    end

  end
end
