require "spec_helper"

module Hangman
  describe Letter do

    context "#initialize" do
      it "accepts and sets a value" do
        letter = Letter.new("a")
        expect(letter.value).to eq "a"
      end
      it "converts the input to lowercase" do
        letter = Letter.new("Z")
        expect(letter.value).to eq "z"
      end
      it "sets @guessed to false" do
        letter = Letter.new("a")
        expect(letter.guessed).to eq false
      end
    end

    context "#display" do
      it "returns a string" do
        letter = Letter.new("a")
        expect(letter.display).to be_a String
      end 
      it "returns '_' if not guessed" do
        letter = Letter.new("a")
        expect(letter.display).to eq "_"
      end
      it "returns its value if guessed" do
        letter = Letter.new("a")
        letter.guessed = true
        expect(letter.display).to eq letter.value
      end
    end

    context "#reveal" do
      it "returns the letter's value" do
        letter = Letter.new("a")
        expect(letter.reveal).to eq letter.value
      end
    end

  end
end
