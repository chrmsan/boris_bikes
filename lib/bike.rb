class Bike
  attr_reader :working 

  def initialize
    @working = true
  end 


  def is_broken
    @working = false
  end

end
