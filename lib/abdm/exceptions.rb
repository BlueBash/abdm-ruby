# frozen_string_literal: true

module Abdm
  class APIException < StandardError
    attr_accessor :response_body, :response_code

    def initialize(response)
      @response_body = response.parsed_response
      @response_code = response.code

      super error_message
    end

    private

    def error_message
      response_body.dig('error', 'message').presence || response_body['message']
    end
  end

  class ValidationError < StandardError; end
end
