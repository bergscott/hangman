require "spec_helper"

module Hangman
  describe Game do

    context "#initialize" do
      it "picks a random word" do
        game = Game.new
        expect(game.word).to be_a Word
      end
      it "picks from the provided dictionary" do
        test_word = "testing"
        test_fname = "spec/spec_dict.txt"
        File.open(test_fname, "w") { |file| file.puts test_word }
        game = Game.new(dict_fname: test_fname)
        expect(game.word.reveal).to eq test_word
      end
      it "only picks words of length between min/max" do
        target_word = "spoon"
        words = ["a"*4, "a"*13] << target_word
        test_fname = "spec/spec_dict.txt"
        File.open(test_fname, "w") { |file| file.puts words }
        game = Game.new(dict_fname: test_fname, min_ch: 5, max_ch: 12)
        expect(game.word.reveal).to eq target_word
      end
      it "is created with 6 guesses left by default" do
        game = Game.new
        expect(game.guesses_left).to eq 6
      end
      it "is sets @letters_guessed to an empty list" do
        game = Game.new
        expect(game.letters_guessed).to eq []
      end
    end

  end
end
