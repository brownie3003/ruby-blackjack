require 'spec_helper'

describe Rules do
    before do
        @rules = Rules.new
        @blackJack = [Card.new("Hearts", "Ace"), Card.new("Clubs", "Jack") ]
        @fourAces = [Card.new("Hearts", "Ace"), Card.new("Clubs", "Ace"), Card.new("Spades", "Ace"), Card.new("Diamonds", "Ace")]
    end

    describe "calculating black jack score" do
        it "should calculate the correct score" do
            expect(@rules.score(@blackJack)).to eql(21)
        end
    end

    describe "calculating 4 aces" do
        it "should return the correct array of scores" do
            (@rules.score(@fourAces)).should =~ [4,14]
        end
    end
end