require 'spec_helper'

describe Rules do
    before do
        @rules = Rules.new
        @blackJack = [Card.new("Hearts", "Ace"), Card.new("Clubs", "Jack") ]
        @aceIsOne = [Card.new("Hearts", "Ace"), Card.new("Club", "Jack"), Card.new("Spade", 7)]
    end

    describe "calculating the score," do
        it "should calculate the correct score" do
            expect(@rules.score(@blackJack)).to eql(21)
        end
    end

    describe "calculating the score when the value of Ace is One" do
        it "should calculate the correct score" do
            expect(@rules.score(@aceIsOne)).to eql(18)
        end
    end
    
end