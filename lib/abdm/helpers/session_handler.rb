module ABDM
  module Helpers
    module SessionHandler

      def authentication_token
        return session_token if session_token && session_token_valid?

        fetch_session_token
      end

      def fetch_session_token
        @token_expiry_time = Time.now + 5.minutes
        response           = post(GATEWAY_URL, session_credentials_body)

        render_response(response, store_identifiers: 'session_token')
        session_token
      end

      protected

      def session_token_valid?
        token_expiry_time && token_expiry_time >= Time.now
      end

      def session_credentials_body
        {
          body: {
            clientId: ABDMConfig[:client_id],
            clientSecret: ABDMConfig[:client_secret],
            grantType: 'client_credentials'
          }.to_json,
          headers: default_headers
        }
      end
    end
  end
end
