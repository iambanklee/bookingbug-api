require "booking_bug_api/version"
require "booking_bug_api/api_handler"

module BookingBugApi
  class << self
    def get_services
      api = BookingBugApi::ApiHandler.new('https://us.bookingbug.com/api/v1/114784/services', app_id: '84908c565a851882d073897881684771644c0dc9df90')
      data = api.get
      data['_embedded']['services']
    end

    def print_q4(number = 2)
      services = get_services

      puts "Last #{number} names of #{services.size} services are:"
      services.last(number).each do |service|
        puts service['name']
      end
    end
  end
end
