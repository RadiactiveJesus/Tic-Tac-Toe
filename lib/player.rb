class Player
  attr_accessor :name, :symbol, :positions
  
	
  def initialize(name, symbol)
    @name = name
    @symbol = symbol
    @positions = [] 
  end

  def move(index)
    @positions.push(index)
  end

  
end
