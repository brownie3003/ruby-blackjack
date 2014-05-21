class Rules

    def score(hand)
        score = 0
        hand.each do |card|
            setCardValue(card)
            score += card.value
        end

        return score
    end
    
    def endTurn?(player)
        if score(player.hand) > 21
            player.bust = true
            return true  
        elsif player.stick
            return true
        end
    end

    def calculateWinners(players, dealer)
        if dealer.bust
            puts "Random Drunk in the Corner: Dealers Bust, everyone's a winner baby"
            for player in players do
                if !player.bust
                    "Dealer: #{player.name} won!"
                end
            end
        else
            players.each do |player|
                # Player is not the dealer and not bust
                if player != dealer and !player.bust
                    if score(player.hand) >= score(dealer.hand)
                        puts "#{player.name} won!"
                    else
                        puts "Unfortunately #{player.name} lost."
                    end
                end
            end
        end
    end

    private

        # Set BlackJack specific values for cards
        def setCardValue(card)
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
