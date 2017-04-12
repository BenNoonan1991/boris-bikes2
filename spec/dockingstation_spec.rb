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
  end

 describe '#dock' do
   it {is_expected.to respond_to(:dock).with(1).argument}

   it "raises error when user trues to dock bike beyond capacity" do
    DockingStation::DEFAULT_CAPACITY.times {subject.dock(Bike.new)}
    expect { subject.dock(Bike.new) }.to raise_error "Station Full"
  end

   it "docks a bike" do
    bike = Bike.new
    expect(subject.dock(bike)).to eq [bike]
  end
 end
end
