require 'json'
require 'time'

require 'abdm/helpers/headers_params'
require 'abdm/helpers/api_operations'
require 'abdm/helpers/session_handler'
require 'abdm/helpers/response_handler'
require 'abdm/helpers/store_resources'

module ABDM
  class Base < OpenStruct
    attr_accessor :session_token, :token_expiry_time, :transaction_id, :parsed_response, :x_token, :t_token, :hpr_token, :x_hprid_token, :tracking_id

    extend HTTParty
    include ABDM::Helpers::HeadersParams
    include ABDM::Helpers::ApiOperations
    include ABDM::Helpers::SessionHandler
    include ABDM::Helpers::ResponseHandler
    include ABDM::Helpers::StoreResources

    def initialize
      require 'abdm/helpers/urls'
      super
    end
  end
end
