require 'dockingstation.rb'

describe DockingStation do

  describe '#release_bike' do
    it {is_expected.to respond_to :release_bike}

    it "raises error when no bike" do
      expect{subject.release_bike}.to raise_exception "No Bikes Available to release"
    end

    it "releases a bike" do
      bike = Bike.new
      expect(bike).to be_working
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
  end

      it 'has a default capacity' do
    expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end
end

  describe '#dock' do
   it {is_expected.to respond_to(:dock).with(1).argument}

    # it "raises error when user tries to dock bike beyond capacity" do
    #  DockingStation::DEFAULT_CAPACITY.times {subject.dock(Bike.new)}
    #  expect { subject.dock(Bike.new) }.to raise_error "Station Full"


    it "docks a bike" do
      bike = Bike.new
      expect(subject.dock(bike)).to eq [bike]
    end



    it "raises and error when full" do
      subject.capacity.times {subject.dock Bike.new }
      expect { subject.dock(Bike.new) }.to raise_error "Station Full"
    end
  end

  describe 'initialization'do
    subject { DockingStation.new }
    let(:bike) { Bike.new }
    it 'defaults capacity' do
      described_class::DEFAULT_CAPACITY.times do
        subject.dock(bike)
      end
      expect{ subject.dock(bike) }.to raise_error 'Docking station full'
    end
  end
end
