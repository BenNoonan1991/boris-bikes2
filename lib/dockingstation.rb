require_relative 'bike'

class DockingStation

  DEFAULT_CAPACITY = 20

  attr_reader :capacity
  attr_accessor :broken_bikes

  def initialize(capacity = DEFAULT_CAPACITY)
    @broken_bikes = []
    @working_bikes = []
    @capacity = capacity
  end


  def release_bike
    fail "No bikes available" if empty?
    working_bikes.pop
  end

  def dock(bike)
    fail "Docking station full" if full?
    bike.working? ? working_bikes << bike : broken_bikes << bike
  end

  def send_broken_bikes_to(delivery_vehicle)
    delivery_vehicle.items_for_delivery = broken_bikes
  end

  def bikes
    working_bikes + broken_bikes
  end

  private

  attr_accessor :working_bikes

  def full?
    (broken_bikes + working_bikes).length  >= capacity
  end

  def empty?
    working_bikes.empty?
  end
end
