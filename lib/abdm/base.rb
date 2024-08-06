require 'net/http'
require 'json'
require 'time'

module Abdm
  class Base
    ABHA_BASE_URL = 'https://abhasbx.abdm.gov.in/'.freeze
    GATEWAY_URL = 'https://dev.abdm.gov.in/gateway/'.freeze

    def initialize
      @session_token = set_session_token
      @token_expiry_time = Time.now + 5.minute
    end

    def authentication
    end

    private

    def ensure_session_token
    end

    def get_session_token
    end

    def set_session_token
    end
  end
end
