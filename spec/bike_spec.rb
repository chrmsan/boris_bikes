require 'docking_station'

describe Bike do


  it "should set bike.is_broken equals true" do
    bike = Bike.new
    expect(bike.is_broken).to eq true
  end

end
