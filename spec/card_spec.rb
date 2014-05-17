require 'spec_helper'

describe Card do
    before :each do
        @card = Card.new "Hearts", 10
        @aceCard = Card.new "Clubs", "Ace"
    end
    
    describe "Instantiating a card" do
        it "should be done correctly" do
            expect(@card).to be_a Card
            expect(@card.suit).to eql "Hearts"
            expect(@card.value).to eql 10
        end
    end
    
    subject { @card }
    
    it { should respond_to :suit }
    it { should respond_to :value }
    
    describe "comparing two cards" do
        before do
            @lowerCard = Card.new "Hearts", (@card.value - 1)
        end
        
        it "should be of higher value than a lower value card" do
            @card > @lowerCard
        end
    end
    
    describe "comparing it against an Ace" do
        
        it "should be lower than an Ace" do
            @card < @aceCard
        end
    end
    
    describe "setting an Ace to low" do
        before do
            @aceCard.value = 1
        end
        
        it "should be of a higher value than the Ace" do
            @card > @aceCard
        end
    end
end
