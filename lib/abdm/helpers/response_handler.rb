module ABDM
  module Helpers
    module ResponseHandler

      def render_response(res, store_identifiers: nil)
        validate_response(res)

        store_identifiers.split(', ').each do |store_identifier|
          public_send("store_#{store_identifier}")
        end if store_identifiers.present?

        parsed_response
      end

      private

      def validate_response(res)
        unless res.code.between?(200, 208)
          raise ABDM::APIException.new res
        end
      end
    end
  end
end
