require "pry"

class Game
    attr_accessor :player1, :player2

    def initialize(pseudo1, pseudo2, icons)
        tag1 = icons.sample
        icons.delete(tag1)
        tag2 = icons.first
        @player1 = Player.new(pseudo1, tag1)
        @player2 = Player.new(pseudo2, tag2)
    end

end