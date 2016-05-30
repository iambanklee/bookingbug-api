require 'json'
require 'net/http'

module BookingBugApi
  class ApiHandler

    def initialize(api_end_point, options = {})
      @api_end_point = api_end_point
      @uri           = URI(@api_end_point)
      @options       = options
    end

    def get(params = {})
      @uri.query = URI.encode_www_form(params)
      @req = Net::HTTP::Get.new(@uri)
      @req['App-Id'] = @options[:app_id]

      @response = Net::HTTP.start(@uri.hostname, @uri.port, :use_ssl => @uri.scheme == 'https') {|http|
        http.request(@req)
      }

      parser_response
    end

    private
    def parser_response
      case @response.code
      when "200"
        JSON.parse(@response.body)
      else
        @response.body
      end
    end

  end
end
