require 'garage'

describe Garage do
  it { is_expected.to respond_to(:deliver_broken_bikes).with(1).argument }
end
