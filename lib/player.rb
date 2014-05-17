class Player
    attr_accessor :hand, :stick, :bust
    attr_reader :name
    
    require './lib/rules.rb'
    
    def initialize name
        @name = name
        @hand = []
        @stick = false
        @bust = false
    end
end
