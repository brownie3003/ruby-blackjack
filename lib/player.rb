class Player
    attr_accessor :hand, :stick, :bust
    attr_reader :name
    
    require './lib/rules.rb'
    
    def initialize name
        @name = name
        @hand = []
        @stick = false
        @bust = false
        @rules = Rules.new
    end
    
    def showHand
        if @hand.empty?
            puts "hand is empty"
        else
            @hand.each do |card|
                puts "#{card.rank} of #{card.suit}"
            end
            puts "You are on #{@rules.score(self)}"
        end
            
    end
    
    # def score
    #     score = 0
    #     @hand.each do |card|
    #         score += card.value
    #     end
    #     return score
    # end
end
