require 'json'
require 'time'

require 'abdm/api_exception'
require 'abdm/helpers/api_operations'
require 'abdm/helpers/session_handler'

module Abdm
  class Base < OpenStruct
    attr_accessor :session_token, :token_expiry_time

    extend HTTParty
    include Abdm::Helpers::ApiOperations
    include Abdm::Helpers::SessionHandler

    def initialize
      require 'abdm/helpers/urls'
      super
    end

    def validate_response(response)
      unless response.code.between?(200, 208)
        raise Abdm::APIException.new response
      end
    end
  end
end
