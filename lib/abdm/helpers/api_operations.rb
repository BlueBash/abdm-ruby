module Abdm
  module Helpers
    module ApiOperations
      require 'httparty'

      def process_api_request(http_method, url, options = {})
        response = HTTParty.send(http_method, url, options)
        @parsed_response = response.parsed_response

        response
      end

      protected

      %i[get post delete put].each do |http_method|
        define_method(http_method) do |url, options = {}|
          process_api_request(http_method, url, options)
        end
      end
    end
  end
end
