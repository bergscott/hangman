require "spec_helper"

module Hangman
  describe Word do

    context "#initialize" do
      it "converts a string to an array" do
        word = Word.new("test")
        expect(word.letters).to be_a Array
      end
      it "converts a string to an array of letters" do
        word = Word.new("test")
        expect(word.letters[0]).to be_a Letter
      end
    end

    context "#display_progress" do
      it "returns a string" do
        word = Word.new("test")
        expect(word.display_progress).to be_a String
      end
      it "when unguessed, returns a string of space delimited underscores" do
        word = Word.new("test")
        expect(word.display_progress).to match /[_ ]+/
      end
    end

    context "#reveal" do
      it "returns the input string in lowercase" do
        input = "TeSt"
        word = Word.new(input)
        expect(word.reveal).to eq input.downcase
      end
    end

    context "#solved?" do
      it "returns true if all letters have been guessed correctly" do
        word = Word.new("as")
        word.update("a")
        word.update("s")
        expect(word.solved?).to eq true
      end
      it "returns false if not all letters have been guessed correctly" do
        word = Word.new("as")
        word.update("a")
        expect(word.solved?).to eq false
      end
    end

    context "#good_guess?" do
      it "returns true if the guess matches any letter's value" do
        word = Word.new("bat")
        expect(word.good_guess?("a")).to eq true
      end
      it "returns false if the guess does not match any letter's value" do
        word = Word.new("bat")
        expect(word.good_guess?("z")).to eq false
      end
    end

    context "#update" do
      it "sends Letter#try_guess to each unguessed letter" do
        word = Word.new("bat")
        letter0 = word.letters[0]
        letter1 = word.letters[1]
        letter2 = word.letters[2]
        expect(letter0).to receive(:try_guess)
        expect(letter1).to receive(:try_guess)
        expect(letter2).to receive(:try_guess)
        word.update("a")
      end
    end

  end
end
