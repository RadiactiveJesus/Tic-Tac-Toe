require '../lib/logic.rb'
game = Board.new

until game.win?("X") || game.win?("O")
    print "Type your turn : "

    input = gets.chomp 
    case input
    when "0" 
        game.add_at(0, 0)
    when "1" 
        game.add_at(0, 1)
    when "2" 
        game.add_at(0, 2)
    when "3" 
        game.add_at(1, 0)
    when "4" 
        game.add_at(1, 1)
    when "5" 
        game.add_at(1, 2)
    when "6" 
        game.add_at(2, 0)
    when "7" 
        game.add_at(2, 1)
    when "8" 
        game.add_at(2, 2)
    else 
        print "Thats not a valid position"
    end
end



     