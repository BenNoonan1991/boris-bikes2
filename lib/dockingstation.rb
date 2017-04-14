require_relative 'bike'

class DockingStation

  DEFAULT_CAPACITY = 20

  attr_reader :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end


  def release_bike
    fail "No bikes available" if empty?
    working_bikes.pop
  end

  def dock(bike)
    fail "Docking station full" if full?
    bikes << bike
  end

  def send_broken_bikes_to
  end

  private

  attr_accessor :bikes

  def full?
    bikes.length >= @capacity
  end

  def empty?
    working_bikes.empty?
  end

  def working_bikes
    bikes.select{ |bike| bike.working? }
  end
end
