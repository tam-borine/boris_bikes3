require 'docking_station'
require 'rspec/its'

describe DockingStation do

  it "when asking DockingStation to release_bike, a bike is released" do
    expect(subject).to respond_to(:release_bike) #WHy do we need to pass the release_bike method as a symbol
  end

  it "released working bikes" do
    bike = double(:bike) #NEED DOUBLE?
    expect(bike).to be_working
  end

  it "docks bike at docking station" do
    expect(subject).to respond_to(:dock)
    end

  it "docks the particular bike" do
    bike = double(:bike) #NEED DOUBLE?
    expect(subject.dock(bike)).to eq [bike] #this test only works when one bike exists
  end

  it "the particular is bike I've docked is amongst the docked bikes" do
    bike1 = double(:bike) #NEED DOUBLE?
    bike2 = double(:bike)
    subject.dock(bike1)
    expect(subject.dock(bike2)).to include bike1
  end

  describe "#release_bike" do
    it "releases a bike" do
      bike = double(:bike) #NEED DOUBLE?
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
    end

    it "should not release a broken bike" do
      bike = double(:bike) #NEED DOUBLE?
      subject.dock(bike.report)
      expect { subject.release_bike }.to raise_error "no working bikes available"
    end

    it "raises an error when there are no bikes available" do
#because we don't dock any bikes in this test, there should be none available
      expect { subject.release_bike }.to raise_error "no bikes available"
    end
  end


  describe "#dock" do
    it "raises error when there is no more capacity" do #NEED DOUBLE?
        DockingStation::DEFAULT_CAPACITY.times {subject.dock double(:bike)}
      expect { subject.dock(double(:bike)) }.to raise_error "there is no capacity"
    end

    it "broken bikes are still allowed to be docked" do
      #pending "To satisfy this test, approach reporting differently eg.use Bike class"
      bike = double(:bike) #NEED DOUBLE?
       #dock and report broken bike
      expect(subject.dock(bike.report)).to include bike
    end
  end

  describe "capacity" do
    #Test calls new instance of subject and passes to 'its' test.
    subject{DockingStation.new(30)}
    its(:capacity){should eq(subject.capacity)}
    end

    its(:capacity){should eq(subject.capacity)}
end
