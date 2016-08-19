require 'transfer'

describe Transfer do

  let(:bike) {double(:bike)}
  let(:docking_station) {double(:docking_station, :count => 10)}

  it "collects stuff" do
    #given the dock has broken bikes
    #when I pass the garbage collect method
    #i expect dock to no longer contain broken bikes
    expect {docking_station.collect}.to change{docking_station.count}.to(0)
  end

end
