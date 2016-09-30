require_relative 'bike'

class DockingStation
  attr_reader :bikes, :capacity, :bike
  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @bikes_broken = []
    @capacity = capacity
  end

  def release_bike
    fail 'No bikes available' if empty?
    @bikes.pop
  end

  def dock(bike)
    fail "Can't park! The station is full!" if full?

   if bike.broken
      @bikes_broken << bike
   else
      @bikes << bike
   end
  end


  private

  def empty?
    @bikes.count == 0
  end

  def full?
    @bikes.count >= capacity
  end
end

