require_relative 'Bike'


class DockingStation
  attr_reader :bike
  CAPACITY = 20
  def initialize
    @bikes = []
  end

  def release_bike
    fail "No bikes available" if empty?
    @bikes.pop
  end

  def dock(bike)
    fail 'Docking station full' if full?
    @bikes << bike

  end

  def full?
    @bikes.count >= CAPACITY

  end

  def empty?
      @bikes.count <= 0
  end
  private :full?, :empty?
end
