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

    context "#try_guess" do
      it "sets @guessed to true if the guess matches its value" do
        letter = Letter.new("a")
        letter.try_guess("a")
        expect(letter.guessed).to eq true
      end
      it "does nothing if the guess does not match its value" do
        letter = Letter.new("a")
        letter.try_guess("b")
        expect(letter.guessed).to eq false
      end
    end

    context "#match" do
      it "returns true if the guess matches its value" do
        letter = Letter.new("a")
        expect(letter.match?("a")).to eq true
      end
      it "returns false if the guess does not match its value" do
        letter = Letter.new("a")
        expect(letter.match?("b")).to eq false
      end
    end

    context "#guessed?" do
      it "returns false if the letter has not been guessed" do
        letter = Letter.new("a")
        expect(letter.guessed?).to eq false
      end
      it "returns ture if the letter has been guessed correctly" do
        letter = Letter.new("a")
        letter.try_guess("a")
        expect(letter.guessed?).to eq true
      end
    end

  end
end
