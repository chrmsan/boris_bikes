require 'docking_station'

describe Bike do

  it { is_expected.to respond_to :working }

  it { is_expected.to respond_to :is_broken }

  it "should set bike.is_broken equals true" do
    bike = Bike.new
    expect(bike.is_broken).to eq false
  end

end
