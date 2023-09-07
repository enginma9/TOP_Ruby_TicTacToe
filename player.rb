class Player
    @@number_of_players = 0
    attr_accessor :name
    # Keep track of wins and losses
    def initialize(name)
        @name = name
        @player_number = @@number_of_players
        @@number_of_players += 1
        @wins = 0
        @losses = 0
        self.announce()
    end

    def announce()
        puts (@player_number + 1).to_s + ". #{name} | Wins: #{@wins} | Losses:#{@losses}\n"
    end

    def won()
        @wins+=1
        puts "\n#{name} says, \"who wants some?\" \n"
    end
    
    def lost()
        @losses += 1
    end
end