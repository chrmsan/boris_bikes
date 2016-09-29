require_relative 'Bike'


class DockingStation
  attr_reader :bike
  attr_reader :capacity

  DEFAULT_CAPACITY = 20

  def initialize(capacity)
    @bikes = []
    capacity = @capacity
    @capacity = DEFAULT_CAPACITY
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
    @bikes.count >= @capacity
  end

  def empty?
      @bikes.count <= 0
  end
  private :full?, :empty?
end
