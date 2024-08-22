module Abdm
  module Helpers
    module StoreResources

      def store_session_token
        @session_token = "Bearer " + parse_access_token
      end

      def store_transaction_id
        @transaction_id = parsed_response['txnId']
      end

      def store_x_token
        @x_token = "Bearer " + parsed_response['token']
      end

      def store_t_token
        @t_token = "Bearer " + parsed_response['token']
      end

      private

      def parse_access_token
        parsed_response['accessToken'].presence || parsed_response.dig('tokens', 'token')
      end
    end
  end
end