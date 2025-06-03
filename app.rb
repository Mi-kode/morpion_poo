require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'
require_relative 'lib/board'

# Initialisation
icons = ["🔷", "🔴"]

puts "Bienvenue dans ❌ Tic-Tac-Toe ⭕ !"
puts"\nJoueur 1 :"
print ">> "
pseudo1 = gets.chomp

puts"\nJoueur 2 :"
print ">> "
pseudo2 = gets.chomp

my_game = Game.new(pseudo1, pseudo2, icons)

puts "\n#{my_game.player1.name} => #{my_game.player1.icon}"
puts "VS"
puts "#{my_game.player2.name} => #{my_game.player2.icon}"