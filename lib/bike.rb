class Bike
  attr_reader :broken 

  def initialize
    @broken = false
  end 


  def is_broken
    @broken = true
  end

end
