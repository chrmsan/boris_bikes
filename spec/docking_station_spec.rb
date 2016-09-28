require 'spec_helper'

describe DockingStation do
  before :each do
     @bikes = Bike.new
   end
  it {is_expected.to respond_to :release_bike}

  it { is_expected.to respond_to(:dock).with(1).argument }

  it 'docks something' do

    @bikes = Bike.new

    expect(subject.dock(@bikes)).to match_array(@bikes)
  end

  it 'returns docked bikes' do
    @bikes = Bike.new
    #subject.dock(@bikes)

    expect(subject.dock(@bikes)).to match_array(@bikes)
  end

  describe '#release_bike' do
    it 'raises an error when there are no bikes available' do
      expect { subject.release_bike }.to raise_error 'No bikes available'
    end
  end
  describe '#dock' do
    it 'raises an error when full' do
      20.times {subject.dock Bike.new}
      expect {subject.dock Bike.new}.to raise_error 'Docking station full'
    end
  end

  it 'releases working bikes' do
    @bikes = subject.release_bike
    expect(@bikes).to be_working
  end


end
