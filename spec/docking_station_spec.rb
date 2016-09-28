require 'docking_station'

describe DockingStation do

  it { is_expected.to respond_to :release_bike }

  it { is_expected.to respond_to(:dock).with(1).argument }

  it { is_expected.to respond_to :bikes }

  it { is_expected.to respond_to :capacity }

  it 'should let user set capacity and return that new capacity' do
    expect(DockingStation.new(30).capacity).to eq 30
  end

  it "should have a default capacity of 20" do
    expect(DockingStation.new.capacity).to eq 20
  end

  describe '#dock' do
    it 'raises an error when the station is full' do
      DockingStation::DEFAULT_CAPACITY.times{ subject.dock Bike.new }
      expect { subject.dock(Bike.new) }.to raise_error "Can't park! The station is full!"
    end

    it 'docks something' do
      bike = Bike.new
      expect(subject.dock(bike)).to eq bike
    end

    it 'returns docked bikes' do
      arr = []
      20.times {
        bike = Bike.new
        arr << bike
        subject.dock(bike)
      }
      expect(subject.bikes).to eq arr
    end
  end


  describe '#release_bike' do
    it 'raises an error when there are no bikes available' do
      expect { subject.release_bike }.to raise_error 'No bikes available'
    end
    bike = Bike.new
    it 'releases a bike' do
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
    end
    it 'checks that its working' do
      expect(bike).to be_working
    end
  end

end
