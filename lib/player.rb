class Player
  attr_accessor :name, :symbol, :positions
  
	
  def initialize(name, symbol)
    @name = name
    @symbol = symbol
    @positions = []
  end

end
