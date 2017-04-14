require 'dockingstation'


describe DockingStation do
  it { is_expected.to respond_to(:release_bike) }

  it { is_expected.to respond_to(:send_broken_bikes_to).with(1).argument }

  describe 'send_broken_bikes_to' do
    let(:docking_station_broken_bikes_pre_send) {subject.broken_bikes}
    let(:van) {Van.new}
    let(:bike) {Bike.new}
    before(:example) do
      5.times { bike.report_broken; subject.dock(bike) }
      subject.send_broken_bikes_to(van)
    end
    it "sends @brokens_bikes array to van.items_for_delivery" do
      expect(van.items_for_delivery).to eq docking_station_broken_bikes_pre_send
    end
    it "removes bikes from @broken_bikes array after transfer to delivery vehicle" do
      expect(subject.broken_bikes).to be_empty
    end
      
  end


  describe '#release_bike' do
    let(:bike) { double :bike }
    it 'releases a bike' do
      allow(bike).to receive(:working?).and_return(true)
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
    end

    it 'raises an error when there are no bikes available' do
      expect { subject.release_bike }.to raise_error 'No bikes available'
    end

  end

  describe '#dock' do
    let(:bike) { double :bike }
    it 'returns instance of Bike class' do
      allow(bike).to receive(:working?).and_return(true)
      subject.dock(bike)
      expect(subject.bikes).to include(bike)
    end

    it 'raises an error when full' do
      allow(bike).to receive(:working?).and_return(true)
      subject.capacity.times { subject.dock bike}
      expect { subject.dock(bike) }.to raise_error 'Docking station full'
    end

    it '#bike returns docked bike' do
      allow(bike).to receive(:working?).and_return(true)
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
    end

  end

  it 'has a default capacity' do
    expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end


  describe 'initializiation' do
    subject { DockingStation.new }
    let(:bike) { double(:bike) }
    it 'defaults capacity' do
      allow(bike).to receive(:working?).and_return(true)
      described_class:: DEFAULT_CAPACITY.times do
        subject.dock(bike)
      end
      expect{ subject.dock(bike) }.to raise_error 'Docking station full'
    end
  end
end
