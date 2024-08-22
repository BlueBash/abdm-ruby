module Abdm
  module Helpers
    module SessionHandler

      def authentication_token
        return session_token if session_token && session_token_valid?

        request_session_token
      end

      protected

      def session_token_valid?
        token_expiry_time && token_expiry_time >= Time.now
      end

      def request_session_token
        @token_expiry_time = Time.now + 5.minutes
        response           = post(GATEWAY_URL, session_credentials_body)

        render_response(response, store_identifiers: 'session_token')
        session_token
      end

      def session_credentials_body
        {
          body: {
            clientId: AbdmConfig[:client_id],
            clientSecret: AbdmConfig[:client_secret],
            grantType: 'client_credentials'
          }.to_json,
          headers: content_type
        }
      end
    end
  end
end
