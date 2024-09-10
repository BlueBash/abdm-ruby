require 'abdm/request_body/hfr_master_api_params'

module Abdm
  module Hfr
    module MasterApis
      include ABDM::RequestBody::HfrMasterApiParams

      # Instance method to fetch Master Types
      def fetch_master_types
        send_request(__method__, api_method: :get)
      end

      # Instance method to fetch Master Data
      def fetch_master_data(params)
        send_request(__method__, search_params: params, api_method: :get)
      end

      # Instance method to fetch LGD States
      def fetch_lgd_states
        send_request(__method__, api_method: :get)
      end

      # Instance method to fetch Facility Types
      def fetch_facility_type(params = {})
        send_request(__method__, params:)
      end

      # Instance method to fetch Owner Subtypes
      def fetch_owner_subtypes(params = {})
        send_request(__method__, params:)
      end

      # Instance method to fetch Specialities
      def fetch_specialities(params = {})
        send_request(__method__, params:)
      end

      # Instance method to fetch Facility Subtypes
      def fetch_facility_subtype(params = {})
        send_request(__method__, params:)
      end

      # Instance method to fetch ABDM Compliant Software
      def fetch_abdm_compliant_software
        send_request(__method__, api_method: :get)
      end

      private

      def send_request(method_name, api_method: :post, params: {}, search_params: {})
        send_master_api_request('HFR', method_name, api_method:, params:, search_params:)
      end
    end
  end
end
