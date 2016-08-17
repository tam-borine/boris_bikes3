require_relative "bike"

class DockingStation

  def initialize
    @bikes = []
  end

  def dock(bike)
    fail "there is no capacity" if @bikes.count >= 20
    @bikes << bike
  end

  def release_bike
    fail "no bikes available" if @bikes.empty?
    @bikes.pop
  end

attr_reader :bikes

end
