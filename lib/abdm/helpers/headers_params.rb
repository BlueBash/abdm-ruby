require 'securerandom'

module Abdm
  module Helpers
    module HeadersParams

      def headers_params(request_id: false, time_stamp: false, txn_id: false, abdm_x_token: false, abdm_t_token: false)
        params = content_type

        params['Authorization']  = authentication_token
        params['TIMESTAMP']      = iso_timestamp  if time_stamp
        params['REQUEST-ID']     = randomUUID     if request_id
        params['Transaction_id'] = transaction_id if txn_id
        params['X-token']        = x_token        if abdm_x_token
        params['T-token']        = t_token        if abdm_t_token

        params
      end

      private

      def content_type
        { 'Content-Type' => 'application/json' }
      end

      def iso_timestamp
        Time.now.utc.iso8601(3)
      end

      def randomUUID
        SecureRandom.uuid
      end
    end
  end
end


