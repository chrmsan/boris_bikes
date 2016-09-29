require_relative 'docking_station'

class Bike

  def working?
    true
  end

  def is_broken
   @broken = true
  end

  def broken?
    @broken
  end
end
