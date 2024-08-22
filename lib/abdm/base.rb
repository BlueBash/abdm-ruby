require 'json'
require 'time'

require 'abdm/helpers/headers_params'
require 'abdm/helpers/api_operations'
require 'abdm/helpers/session_handler'
require 'abdm/helpers/response_handler'
require 'abdm/helpers/store_resources'

module Abdm
  class Base < OpenStruct
    attr_accessor :session_token, :token_expiry_time, :transaction_id, :parsed_response, :x_token, :t_token

    extend HTTParty
    include Abdm::Helpers::HeadersParams
    include Abdm::Helpers::ApiOperations
    include Abdm::Helpers::SessionHandler
    include Abdm::Helpers::ResponseHandler
    include Abdm::Helpers::StoreResources

    def initialize
      require 'abdm/helpers/urls'
      super
    end
  end
end
