require_relative 'game.rb'

# use this (main) for calling and starting the current game, 
# loop will be here or in separate "game.rb" 
# define board class
# define player class - what data should that include? Wins-Losses? Maybe keep track of more than 2 players with their names?
# game gets passed the two players, and creates board object
# board has function for win condition
# board array starts at 0, but displays 1-9, so board will translate the values

the_game = Game.new()   # You've lost. 
the_game.run()
