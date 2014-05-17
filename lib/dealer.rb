class Dealer
    
    require './lib/deck.rb'
    require './lib/rules.rb'
    
    def initialize player
        @deck = Deck.new
        @rules = Rules.new
        @dealer = Player.new "House"
        @players = [player, @dealer]
    end
    
    def deal
        puts "Dealer: Shuffling the deck"
        @deck.shuffle
        puts "Dealer: Burning a card"
        burn
        puts "Dealer: Dealing the first"
        dealFirstCard
        dealHand
        @rules.calculateWinners(@players, @dealer)
        @deck = Deck.new
    end
    
    private

        def burn
            @deck.draw
        end
        
        def dealFirstCard
            @players.each do |player|
                player.hand << @deck.draw
                explainHand player
            end
        end
    
        def dealHand
            @players.each do |player|
                puts "Dealer: #{player.name}'s turn."
                until @rules.endTurn? player
                    if player != @dealer
                        giveOptions player
                        playerChoice player
                    else
                        dealerPlay player
                    end
                end
                
                if player != @dealer
                    if player.bust
                        puts "Dealer: #{player.name} was bust, sorry, better luck next time."
                    elsif player.stick
                        puts "Dealer: #{player.name} has elected to stick. Good luck."
                    end
                end
            end
        end
        
        def giveOptions player
            puts "Dealer: Your hand is worth #{@rules.score(player.hand)} points. Hit or stick?"
        end
        
        def playerChoice player
            response = gets.chomp
            case response
            when "Hit" 
                puts "#{player.name}: Hit me baby."
                player.hand << @deck.draw
                explainHand player
            when "stick"
                player.stick = true
            else
                puts "#{player.name} has chosen to stick at #{@rules.score(player.hand)}"
            end
        end
        
        def dealerPlay dealer
            puts "Dealer: #{dealer.name} has #{@rules.score(dealer.hand)}"
            if @rules.score(dealer.hand) < 17
                puts "Dealer: Dealer chooses to hit"
                dealer.hand << @deck.draw
                explainHand dealer
            else
                puts "Dealer: Dealer chooses to stick"
                dealer.stick = true
            end 
            sleep(5)
        end
        
        def explainHand player
            if player.hand.empty?
                puts "Dealer: #{player.name}'s hand is empty"
            else
                puts "Dealer: #{player.name} has #{formatHand(player.hand)}."
            end
        end

        def formatHand hand
            formattedHand = Array.new
            hand.each do |card|
                formattedHand << "#{card.rank} of #{card.suit}"
            end
            
            return formattedHand.join(", ")
        end
end
