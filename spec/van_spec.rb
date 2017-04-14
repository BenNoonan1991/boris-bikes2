require 'van'

describe Van do

  it { is_expected.to respond_to(:items_for_delivery) }

  it { is_expected.to respond_to(:send_broken_bikes_to).with(1).argument }

  describe 'send_broken_bikes_to' do
    let(:bike) {Bike.new}
    let(:initially_docked_bikes) {Array.new}
    before(:example) do
      5.times { bike.report_broken; subject.items_for_delivery.push(bike); initially_docked_bikes.push(bike) }
      subject.send_broken_bikes_to(van)
    end
    it "sends @brokens_bikes array to van.items_for_delivery" do
      expect(van.items_for_delivery).to eq initially_docked_bikes
    end
    it "removes bikes from @broken_bikes array after transfer to delivery vehicle" do
      expect(subject.broken_bikes).to be_empty
    end

  end

end
