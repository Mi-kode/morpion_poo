require "pry"

class Game
    attr_accessor :player1, :player2, :casechoice, :current_player

    def initialize(pseudo1, pseudo2, icons)
        tag1 = icons.sample
        icons.delete(tag1)
        tag2 = icons.first
        @player1 = Player.new(pseudo1, tag1)
        @player2 = Player.new(pseudo2, tag2)
        @casechoice = [1, 2, 3, 4, 5, 6, 7, 8, 9]
        @current_player = @player1
    end

    def menu
        puts "\n-------------------------------------"
        puts "| Au tour de #{@current_player.name} (#{@current_player.icon})"
        puts "| Choisis une case disponible parmi : #{@casechoice.select { |c| c.is_a?(Integer) }.join(', ')}"
        puts "| Quitter en entrant 'leave'"
        puts "-------------------------------------"
        print "> "
    end

    def menu_choice(action)
        return :leave if action == "leave"

        choice = action.to_i

        if @casechoice.include?(choice)
            index = @casechoice.index(choice)
            @casechoice[choice - 1] = @current_player.icon
            switch_turn unless victory?
        else
            puts "\nChoix invalide.. Réessaie."
        end
    end

    def display_board
        puts ""
        puts "      |      |      "
        puts "  #{@casechoice[0]}  |  #{@casechoice[1]}  |  #{@casechoice[2]}  "
        puts "______|______|______"
        puts "      |      |      "
        puts "  #{@casechoice[3]}  |  #{@casechoice[4]}  |  #{@casechoice[5]}  "
        puts "______|______|______"
        puts "      |      |      "
        puts "  #{@casechoice[6]}  |  #{@casechoice[7]}  |  #{@casechoice[8]}  "
        puts "      |      |      "
        puts ""
    end

    def switch_turn
        @current_player = (@current_player == @player1 ? @player2 : @player1)
    end

    def victory?
        winning_combos = [
            [0, 1, 2], [3, 4, 5], [6, 7, 8],  # lignes
            [0, 3, 6], [1, 4, 7], [2, 5, 8],  # colonnes
            [0, 4, 8], [2, 4, 6]              # diagonales
        ]

        winning_combos.each do |combo|
            a, b, c = combo
            if
            @casechoice[a] == @casechoice[b] &&
            @casechoice[b] == @casechoice[c] &&
            @casechoice[a].is_a?(String)
                return true
            end
        end

        false
    end

    def full_board?
        @casechoice.none? { |c| c.is_a?(Integer) }
    end

end
