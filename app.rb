require './lib/player.rb'
require './lib/dealer.rb'


puts "Dealer: Hello welcome to BlackJack."

puts "Dealer: What is your name?"

player = gets.chomp

player = Player.new player

puts "Dealer: Hi #{player.name}, let's play"

dealer = Dealer.new player

dealer.play
