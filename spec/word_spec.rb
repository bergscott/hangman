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

  end
end
