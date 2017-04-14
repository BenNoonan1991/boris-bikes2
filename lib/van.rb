class Van
  attr_accessor :items_for_delivery

  def initialize
    @items_for_delivery = []
  end

  def send_broken_bikes_to(garage)
    garage.broken_bikes = items_for_delivery
    self.items_for_delivery = []
  end

end
