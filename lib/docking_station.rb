require_relative 'bike'

class DockingStation
  attr_reader :bikes, :capacity
  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def release_bike
    fail 'No bikes available' if empty?
    fail 'Cannot release, bike is broken' if @bikes.last == false 
   
    @bikes.pop
  end

  def dock(bike)
   fail "Can't park! The station is full!" if full?
   @bikes << bike
   @bikes.last
  end


  private

  def empty?
    @bikes.count == 0
  end

  def full?
    @bikes.count >= capacity
  end
end


=begin
if bike.working
  release_bike
else
  "error"
=end