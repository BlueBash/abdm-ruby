require 'securerandom'

module ABDM
  module Helpers
    module HeadersParams

      def headers_params(klass)
        headers = default_headers

        headers['Authorization'] = authentication_token

        case klass
        when 'ABHA'
          headers.merge!(abha_specific_headers)
        when 'HPR' || 'DOCTER'
        when 'HFR'
          headers['x-hprid-auth'] = x_hprid_token
        end

        headers
      end

      private

      def abha_specific_headers
        {
          'TIMESTAMP'      => iso_timestamp,
          'REQUEST-ID'     => generate_request_id,
          'Transaction_id' => transaction_id,
          'txnId'          => transaction_id,
          'X-token'        => x_token,
          'T-token'        => t_token
        }
      end

      def default_headers
        {
          'Content-Type' => 'application/json',
          'Accept' => 'application/json'
        }
      end

      def iso_timestamp
        Time.now.utc.iso8601(3)
      end

      def generate_request_id
        SecureRandom.uuid
      end
    end
  end
end
