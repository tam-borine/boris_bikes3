require_relative 'docking_station'

class Bike

  def initialize
    @working = true
  end

  def working?
    @working
  end

  #protected

  def report
    @working = false
    self
  end
end
