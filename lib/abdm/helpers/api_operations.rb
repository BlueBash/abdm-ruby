module Abdm
  module Helpers
    module ApiOperations
      require 'httparty'

      def process_api_request(http_method, url, options = {})
        HTTParty.send(http_method, url, merge_headers(options))
      end

      protected

      %i[get post delete put].each do |http_method|
        define_method(http_method) do |url, options = {}|
          process_api_request(http_method, url, options)
        end
      end

      private

      def merge_headers(options)
        options[:headers] = { 'Content-Type' => 'application/json' }
        options
      end
    end
  end
end
