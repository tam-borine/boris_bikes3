require_relative "bike"

class DockingStation

DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @bikes = []
  end

  def dock(bike)
    fail "there is no capacity" if full?
    #fail "please dock only bikes" unless bike.is_a? Bike
    @bikes << bike
  end

  def release_bike
    fail "no bikes available" if station_empty?
    #fail "bike broken" unless working?
    @bikes.pop
  end


  attr_reader :capacity
#### THIS IS WHAT THE attr_reader DOES..... ###
#def bikes
#  @bikes
#end
  private

  attr_reader :bikes

  def full?
    bikes.count >= @capacity
  end

  def station_empty?
    bikes.empty?
  end

end
