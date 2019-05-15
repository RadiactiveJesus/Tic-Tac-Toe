require '../lib/board.rb'
require '../lib/game.rb'
require '../lib/interface.rb'
require '../lib/player.rb'

board = Board.new
player_1 = Player.new('Player 1', 'X')
player_2 = Player.new('Player 2', 'O')
new_game = Game.new(board, player_1, player_2)
new_game.interface

