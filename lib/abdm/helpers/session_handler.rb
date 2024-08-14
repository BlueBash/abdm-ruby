module Abdm
  module Helpers
    module SessionHandler

      def authenticate
        return if session_token_valid?

        request_session_token
      end

      protected

      def session_token_valid?
        token_expiry_time && token_expiry_time >= Time.now
      end

      def request_session_token
        @token_expiry_time = Time.now + 5.minutes
        response = post(GATEWAY_URL, session_credentials_body)

        validate_response(response)
        store_session_token(response)
      end

      def session_credentials_body
        {
          body: {
            clientId: AbdmConfig[:client_id],
            clientSecret: AbdmConfig[:client_secret],
            grantType: 'client_credentials'
          }.to_json
        }
      end

      def store_session_token(response)
        @session_token = response.parsed_response['accessToken']
      end
    end
  end
end
