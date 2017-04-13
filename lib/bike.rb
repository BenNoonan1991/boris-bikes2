class Bike
  def report_broken
    @broken = true
  end

  def broken?
    @broken
  end

  def release_bike
    fail "No bikes available" if broken?
  end
# Test is failing ^


  def working?
    true
  end
end
