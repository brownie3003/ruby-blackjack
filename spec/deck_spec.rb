require 'spec_helper'

describe Deck do
    before :each do
        @deck = Deck.new
    end
    
    it "should be instantiated" do
        expect(@deck).to be_a Deck
        expect(@deck).to respond_to :cards
        expect(@deck.cards.count).to eql(52)
    end
    
    # Don't know how to test random shuffling
    # describe "after shuffling" do
    #     before do
    #         @firstCard = @deck.cards[0]
    #         @deck.shuffle
    # end
end
