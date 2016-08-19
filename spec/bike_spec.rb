require "bike"

describe "Bike" do
  it "bike instances respond to method working" do
    bike = Bike.new
    expect(bike).to respond_to(:working?)
  end

  it "checks bikes can be reported as not working" do
    bike = Bike.new
    bike.report
    expect(bike).not_to be_working
  end

end
