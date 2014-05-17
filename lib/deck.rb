class Deck
    
    require './lib/cards/card.rb'
    
    attr_reader :cards
    
    SUITS = %w[Hearts Spades Diamonds Clubs]
    RANKS = [*2..10, 'Jack', 'Queen', 'King', 'Ace']
    
    def initialize
        @cards = [];
        SUITS.product(RANKS) do |suit, rank|
            @cards << Card.new(suit, rank)
        end
    end
    
    def shuffle
        @cards.shuffle!
    end
    
    def draw
        @cards.shift
    end
    
end
