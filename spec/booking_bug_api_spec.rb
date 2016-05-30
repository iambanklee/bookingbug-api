require 'spec_helper'

describe BookingBugApi do
  it 'has a version number' do
    expect(BookingBugApi::VERSION).not_to be nil
  end

  describe '::get_services' do
    let(:services) { BookingBugApi.get_services }

    it 'should be an Array' do
      expect(services).to be_a Array
    end

    it 'size should be 6' do
      expect(services.size).to be 6
    end

  end

  describe '::print_q4' do
    subject { BookingBugApi.print_q4(number) }

    context 'should be 2 services' do
      let(:number) { 2 }
      it { expect(subject.size).to be 2 }
    end

  end

end
