require_relative 'player.rb'
require_relative 'board.rb'

class Game
    def initialize
        @players = Array.new()
        @p0 = 0
        @p1 = 1
    end

    def usable_input( question = "", acceptable_values = [1,2], except = "" )
        # set initial
        #p acceptable_values
        not_usable = true
        input = ""
        # loop until usable input
        while not_usable do
            puts question
            input = gets.chomp
            acceptable_values.each do |i| 
                if ( input == i.to_s ) && ( input != except.to_s )
                    not_usable = false
                end
            end
            if not_usable
                puts "Sorry, try again.\n"
            end
        end
        return input
    end

    def introduce_new_player(x)
        #p x
        puts "\nWho's next?"
        name = gets.chomp
        @players[x] = Player.new(name)
    end

    def pick_player()
        (usable_input( "Which player?", [*1..@players.length], ( @p0 + 1 ).to_s ).to_i - 1 )
    end

    def run()
        puts "\nWelcome to Tic-Tac-Toe in Ruby\n==============================\n"
        puts "This can handle up to 9 players.\nWinner stays and goes last in the next round.\n"
        puts "\nWho's first?\n"
        name = gets.chomp
        @players[0] = Player.new(name)
        current_player = 1
        notDone = true
        # start game loop
        # each loop ask whether a previous player comes next, or who the next player will be 
        # at the end, ask if they want to continue?
        while notDone do
            #usable_input("Previous player(1), or new(2)?\n",[1,2])
            if @players.length == 1
                introduce_new_player(1)

            elsif @players.length < 9 
                # loop until usable input
                if usable_input("Previous player(1), or new(2)?\n",[1,2]) == "2"
                    introduce_new_player(@players.length)
                else
                    @players.each { |player| player.announce() }
                    p1 = pick_player()
                end
            else
                #loop through announce
                @players.each { |player| player.announce() }
                p1 = pick_player()
            end
            
            # start loop for current
            # call the play method twice, starting with p1 as "X", then p0 as "0"
            # call the_board.play( usable_input( "Pick an available spot.", the_board.open_slots() ) )
            # whoever was the last one to play, will stay on for the next game

            done_status = usable_input("Done(1), or no(2)?\n",[1,2,3], "3")
            #p done_status
            if done_status == "1"
                notDone = false
            end
        end
    end
end

