require 'dockingstation'


describe DockingStation do
  it { is_expected.to respond_to(:release_bike) }



    describe '#release_bike' do
      it 'releases a bike' do
        double(:bike)
        subject.dock(bike)
        expect(subject.release_bike).to eq bike
      end

      it 'raises an error when there are no bikes available' do
        expect { subject.release_bike }.to raise_error 'No bikes available'
    end
  end

  describe '#dock' do
    it 'returns instance of Bike class' do
      double(:bike)
      expect(subject.dock(bike)).to eq [bike]
    end

    it 'raises an error when full' do
      subject.capacity.times { subject.dock double(:bike)}
      expect { subject.dock double(:bike) }.to raise_error 'Docking station full'
    end



    it '#bike returns docked bike' do
      # bike = Bike.new
      # expect(bike).to be_working
      # subject.dock(bike)
      # expect(subject.release_bike).to eq bike
        double(:bike)
        subject.dock(bike)
        expect(subject.release_bike).to eq bike
        # Does not work with private method with array or .bikes

    end
  end

    it 'has a default capacity' do
      expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
    end

  describe 'initializiation' do
    subject { DockingStation.new }
    let(:bike) { double(:bike) }
    it 'defaults capacity' do
      described_class:: DEFAULT_CAPACITY.times do
        subject.dock(bike)
      end
      expect{ subject.dock(bike) }.to raise_error 'Docking station full'
    end
  end
end
