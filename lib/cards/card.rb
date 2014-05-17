class Card
    include Comparable
    
    attr_reader :suit, :rank 
    
    # Allow value of card to be overwritten specifically for the game by the game
    # e.g. in BlackJack: Ace can be 1 or 11 and all face cards are 10
    attr_accessor :value
    
    def initialize suit, rank
        @suit = suit
        @rank = rank
    end
    
    def <=> other_card
        self.value <=> other_card.value
    end
    
    # Provide default 'values' to rankings, although this can be changed
    def value
        if @value == nil
            case @rank
            when 'Ace'
                14
            when 'King'
                13
            when 'Queen'
                12
            when 'Jack'
                11
            else
                @rank
            end
        else
            @value
        end
    end
    
    def to_s
        "#{@rank} of #{@suit}"
    end
end
