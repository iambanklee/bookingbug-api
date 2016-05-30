require 'rspec'
require 'booking_bug_api/api_handler'

describe BookingBugApi::ApiHandler do
  let(:api_handler) {BookingBugApi::ApiHandler.new(api_end_point, options) }

  describe '#get' do
    subject { api_handler.get }

    context 'when correct API endpoint with authorised App-Id' do
      let(:options) { {app_id: '84908c565a851882d073897881684771644c0dc9df90'} }
      let(:api_end_point) { 'https://us.bookingbug.com/api/v1/114784/services' }

      it { should_not be_empty }
      it { should_not eq '{"error":"401 Unauthorized"}' }
      it { should_not eq '{"error":"Not Found"}' }
    end

    context 'when correct API endpoint with UNAUTHORISED App-Id' do
      let(:options) { {app_id: 'kldzfjglkdzfjgkldfjglkzdfjgzdlfkgjzkdfgl128'} }
      let(:api_end_point) { 'https://us.bookingbug.com/api/v1/114784/services' }

      it { should_not be_empty }
      it { should eq '{"error":"401 Unauthorized"}' }
      it { should_not eq '{"error":"Not Found"}' }
    end

    context 'when WRONG API endpoint with authorised App-Id' do
      let(:options) { {app_id: '84908c565a851882d073897881684771644c0dc9df90'} }
      let(:api_end_point) { 'https://uk.bookingbug.com/api/v1/197625/services' }

      it { should_not be_empty }
      it { should_not eq '{"error":"401 Unauthorized"}' }
      it { should eq '{"error":"Not Found"}' }
    end

    context 'when WRONG API endpoint with UNAUTHORISED App-Id' do
      let(:options) { {app_id: 'kldzfjglkdzfjgkldfjglkzdfjgzdlfkgjzkdfgl128'} }
      let(:api_end_point) { 'https://uk.bookingbug.com/api/v1/39847103948067/services' }

      it { should_not be_empty }
      it { should eq '{"error":"401 Unauthorized"}' }
      it { should_not eq '{"error":"Not Found"}' }
    end


  end

end