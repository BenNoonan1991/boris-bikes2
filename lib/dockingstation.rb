require_relative 'bike'

class DockingStation

  DEFAULT_CAPACITY = 20

  attr_reader :capacity

  def initialize(capacity=DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
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

  attr_reader :bikes

  def full?
    @bikes.count >= capacity
  end

  def empty?
    @bikes.empty?
  end

end
