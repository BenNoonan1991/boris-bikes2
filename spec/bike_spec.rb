require 'bike'

describe Bike do
  it {is_expected.to respond_to :working?} # must check why rspec needs a symbol or in speech marks

  it 'can be reported broken' do
    subject.report_broken
    expect(subject).to be_broken
  end

  it 'No bikes available' do
    #subject.broken
    expect { subject.release_bike }.to raise_error 'No bikes available'
  end
  # Test failing, make sure to check



end
