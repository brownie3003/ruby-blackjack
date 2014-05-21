class Dealer
    
    require './lib/deck.rb'
    require './lib/rules.rb'
    
    def initialize(player)
        @deck = Deck.new
        @rules = Rules.new
        @dealer = Player.new "House"
        @players = [player, @dealer]
    end
    
    def play
        puts "Dealer: Shuffling the deck"
        @deck.shuffle
        puts "Dealer: Burning a card"
        burn
        puts "Dealer: Dealing..."
        deal
        addressPlayer
        @rules.calculateWinners(@players, @dealer)
        @deck = Deck.new
    end
    
    private

        def burn
            @deck.draw
        end
        
        def deal
            for i in 1..2
                @players.each do |player|
                    player.hand << @deck.draw
                end
            end
        end

        def addressPlayer
            @players.each do |player|
                puts "Dealer: #{player.name}'s turn."
                dealersHand
                until @rules.endTurn?(player)
                    if player != @dealer
                        explainHand player
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
        
        def dealersHand
            puts "Dealer: House shows #{@dealer.hand[1].to_s}."
        end
        
        def giveOptions(player)
            puts "Dealer: Your hand is worth #{@rules.score(player.hand)} points. Hit or stick?"
        end
        
        def playerChoice(player)
            response = gets.chomp
            case response
            when "Hit" 
                puts "#{player.name}: Hit me."
                card = @deck.draw
                player.hand << card
                puts "Dealer: Card is #{card.to_s}"
            when "stick"
                player.stick = true
            else
                puts "#{player.name} has chosen to stick at #{@rules.score(player.hand)}"
            end
        end
        
        def dealerPlay(dealer)
            explainHand(dealer)
            puts "Dealer: #{dealer.name} has #{@rules.score(dealer.hand)}"
            if @rules.score(dealer.hand) < 17
                puts "Dealer: House chooses to hit"
                card = @deck.draw
                dealer.hand << card
                explainHand(dealer)
            else
                puts "Dealer: House chooses to stick"
                dealer.stick = true
            end 
            sleep(5)
        end
        
        def explainHand(player)
            if player.hand.empty?
                puts "Dealer: #{player.name}'s hand is empty"
            else
                puts "Dealer: Hand is #{formatHand(player.hand)}."
            end
        end

        def formatHand(hand)
            formattedHand = Array.new
            hand.each do |card|
                formattedHand << "#{card.rank} of #{card.suit}"
            end
            
            return formattedHand.join(", ")
        end
end
