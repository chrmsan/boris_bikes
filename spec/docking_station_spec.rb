require 'spec_helper'

describe DockingStation do
  it {is_expected.to respond_to :release_bike}

  it { is_expected.to respond_to(:dock).with(1).argument }

  it 'releases working bikes' do
    @bikes = Bike.new
    expect(@bikes).to be_working
  end

  it 'docks something' do
    @bikes = Bike.new

    expect(subject.dock(@bikes)).to match_array(@bikes)
  end

  it 'returns docked bikes' do
    @bikes = Bike.new
    subject.dock(@bikes)

    expect(subject.release_bike).to eq @bikes
  end

  describe '#release_bike' do
    it 'raises an error when there are no bikes available' do
      expect { subject.release_bike }.to raise_error 'No bikes available'
    end

    it 'raises an error when releasing a broken bike' do
      @bikes = Bike.new
      @bikes.is_broken
      subject.dock(@bikes)
      expect { subject.release_bike }.to raise_error 'This bike is broken'
    end

    it 'releases a working if there is a broken bike' do
      @broken_bikes = Bike.new
      @broken_bikes.is_broken
      subject.dock(@broken_bikes)
      @working_bikes = Bike.new
      subject.dock(@working_bikes)
      expect { subject.release_bike}.to eq @working_bikes
    end
  end

  describe '#dock' do
    it 'checks a default capacity' do
      expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
    end

  end

  describe 'initialization' do
    it 'should have a variable capacity fi. 50' do
      docking_station = DockingStation.new(50)
      50.times { docking_station.dock Bike.new }
      expect { docking_station.dock Bike.new }.to raise_error 'Docking station full'
    end

    subject { DockingStation.new}
    let(:bike) {Bike.new} # bike = Bike.new
    it 'Defaults capacity' do
      described_class::DEFAULT_CAPACITY.times do
        subject.dock(bike)
      end
      expect{subject.dock(bike)}.to raise_error 'Docking station full'
    end
  end

end
