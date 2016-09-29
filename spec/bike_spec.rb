require 'spec_helper'

describe Bike do
  it { is_expected.to respond_to :working?}

  it 'should be able to be reported broken' do
    subject.is_broken
    expect(subject).to be_broken 
  end
end
