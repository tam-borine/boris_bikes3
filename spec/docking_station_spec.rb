require 'docking_station'
require 'rspec/its'

describe DockingStation do

  it "when asking DockingStation to release_bike, a bike is released" do
    expect(subject).to respond_to(:release_bike) #WHy do we need to pass the release_bike method as a symbol
  end

  it "released working bikes" do
    bike = Bike.new
    expect(bike).to be_working
  end

  it "docks bike at docking station" do
    expect(subject).to respond_to(:dock)
    end

  it "docks the particular bike" do
    bike = Bike.new
    expect(subject.dock(bike)).to eq [bike] #this test only works when one bike exists
  end

  it "the particular is bike I've docked is amongst the docked bikes" do
    bike1 = Bike.new
    bike2 = Bike.new
    subject.dock(bike1)
    expect(subject.dock(bike2)).to include bike1
  end

  describe "#release_bike" do
    it "releases a bike" do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
    end

    it "should not release a broken bike" do
      bike = Bike.new
      bike.report
      subject.dock(bike)
      expect { subject.release_bike }.to raise_error "bike broken"
    end


    it "raises an error when there are no bikes available" do
#because we don't dock any bikes in this test, there should be none available
      expect { subject.release_bike }.to raise_error "no bikes available"
    end
  end


  describe "#dock" do
    it "raises error when there is no more capacity" do
        DockingStation::DEFAULT_CAPACITY.times {subject.dock Bike.new}
      expect { subject.dock(Bike.new) }.to raise_error "there is no capacity"
    end

    it "only allows bike objects to be docked" do
      bike = Bike.new
      expect(subject.dock(bike.report)).to include a_kind_of Bike
    end


    it "broken bikes are reported when docked" do
      bike = Bike.new
      subject.dock(bike.report) #dock and report broken bike
      expect(bike).not_to be_working
    end
  end

  describe "capacity" do
    #Test calls new instance of subject and passes to 'its' test.
    subject{DockingStation.new(30)}
    its(:capacity){should eq(subject.capacity)}
    end

    its(:capacity){should eq(subject.capacity)}
end
