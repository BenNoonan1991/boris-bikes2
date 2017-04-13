require_relative 'bike'

class DockingStation

  DEFAULT_CAPACITY = 20

  attr_reader :bike, :bikes, :capacity

  def initialize
    @bikes = []
    @capacity = DEFAULT_CAPACITY
  end


  def release_bike
    fail "No Bikes Available to release" if empty?
    @bikes.pop
  end

  def dock(bike)
    fail "Station Full" if full?
    @bikes << bike
  end

  private
  def full?
    @bikes.count >= DEFAULT_CAPACITY
  end

  def empty?
    @bikes.empty?
  end

end
