# frozen_string_literal: true

module ABDM
  class APIException < StandardError
    attr_reader :response_body, :response_code

    UNKNOWN_ERROR_MESSAGES = {
      400 => "Bad Request - The server could not understand the request due to invalid syntax.",
      401 => "Unauthorized - The client must authenticate itself to get the requested response.",
      403 => "Forbidden - The client does not have access rights to the content.",
      404 => "Not Found - The server can not find the requested resource.",
      500 => "Internal Server Error - The server has encountered a situation it doesn't know how to handle.",
      502 => "Bad Gateway - The server, while acting as a gateway or proxy, received an invalid response from the upstream server.",
      503 => "Service Unavailable - The server is not ready to handle the request.",
      504 => "Gateway Timeout - The server is acting as a gateway and cannot get a response in time."
    }.freeze

    def initialize(response)
      @response_body = response.parsed_response
      @response_code = response.code

      super error_message
    end

    private

    def error_message
      if html_error_message? || response_body.nil?
        UNKNOWN_ERROR_MESSAGES.fetch(response_code, "Unknown error occurred.")
      else
        parsed_error_message
      end
    end

    def html_error_message?
      response_body.to_s =~ /<span[^>]*>([^<]+)<\/span>/
    end

    def parsed_error_message
      response_body.dig('error', 'message').presence || response_body['message']
    end
  end

  class ValidationError < StandardError; end
end
