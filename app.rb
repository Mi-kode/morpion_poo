require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

# Initialisation

puts "Bienvenue dans " + "X".colorize(:blue).bold + " Tic-Tac-Toe " + "O".colorize(:red).bold + " !"
puts"\nJoueur 1 :"
print ">> "
pseudo1 = gets.chomp

puts"\nJoueur 2 :"
print ">> "
pseudo2 = gets.chomp

round = 1

loop do

    system "clear"
    
    icons = ["X".colorize(:blue).bold, "O".colorize(:red).bold]

    my_game = Game.new(pseudo1, pseudo2, icons)

    puts "\n#{my_game.player1.name} => #{my_game.player1.icon}"
    puts "VS"
    puts "#{my_game.player2.name} => #{my_game.player2.icon}"

    # Jeu en cours

    leave = false

    puts "\nRound #{round}"
    
    round += 1

    while !my_game.victory? && !my_game.full_board?
        my_game.display_board
        my_game.menu
        action = gets.chomp
        leave = true if my_game.menu_choice(action) == :leave
        break if leave
    end

    # Fin de game

    if leave
        puts "\nÀ bientôt ! 👋"
        break
    elsif my_game.victory?
        my_game.display_board
        puts "\n#{my_game.current_player.name} a gagné ! 🎉"
    else
        puts "\nMatch nul !"
        my_game.display_board
    end

    puts "\nSouhaitez-vous rejouer ? (y/n)"
    print "> "
    restart = gets.chomp.downcase
    break unless restart == "y"

end
