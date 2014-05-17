class Rules
    
    # def initialize
    #     
    # end
    
    def score hand
        score = 0
        hand.each do |card|
            setCardValue card
            score += card.value
        end
        return score     
    end
    
    def endTurn? player
        if score(player.hand) > 21
            player.bust = true
            return true  
        elsif player.stick
            return true
        end
    end

    def calculateWinners players, dealer
        if dealer.bust
            puts "Everyone's a winner baby"
        else
            players.each do |player|
                if player != dealer
                    if score(player.hand) > score(dealer.hand)
                        puts "#{player.name} won!"
                    else
                        puts "Unfortunately #{player.name} lost."
                    end
                end
            end
        end
    end 

    # Set BlackJack specific values for cards
    def setCardValue card
        case card.rank
        when 'Ace'
            card.value = 11
        when 'King'
            card.value = 10
        when 'Queen'
            card.value = 10
        when 'Jack'
            card.value = 10
        end
    end
end
