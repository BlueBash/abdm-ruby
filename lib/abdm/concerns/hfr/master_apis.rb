require 'abdm/request_body/hfr_master_api_params'

module Abdm
  module Hfr
    module MasterApis
      include ABDM::RequestBody::HfrMasterApiParams

      # Instance method to fetch Master Types
      def fetch_master_types
        hfr_master_api_request(__method__, api_method: :get)
      end

      # Instance method to fetch Master Data
      def fetch_master_data(params)
        hfr_master_api_request(__method__, search_params: params, api_method: :get)
      end

      # Instance method to fetch LGD States
      def fetch_lgd_states
        hfr_master_api_request(__method__, api_method: :get)
      end

      # Instance method to fetch Facility Types
      def fetch_facility_type(params = {})
        hfr_master_api_request(__method__, params:)
      end

      # Instance method to fetch Owner Subtypes
      def fetch_owner_subtypes(params = {})
        hfr_master_api_request(__method__, params:)
      end

      # Instance method to fetch Specialities
      def fetch_specialities(params = {})
        hfr_master_api_request(__method__, params:)
      end

      # Instance method to fetch Facility Subtypes
      def fetch_facility_subtype(params = {})
        hfr_master_api_request(__method__, params:)
      end

      # Instance method to fetch ABDM Compliant Software
      def fetch_abdm_compliant_software
        hfr_master_api_request(__method__, api_method: :get)
      end

      private

      def hfr_master_api_request(method_name, params: {}, api_method: :post, search_params: {})
        method_name = method_name.to_s.remove('fetch_')
        url         = "#{HFR_BASE_URL}/#{MASTERAPI_PATH['hfr_'+method_name]}"
        url         = apply_search_params(url, search_params) if search_params.present?

        params      = {
          body: request_body_master_params(method_name, params),
          headers: headers_params
        }

        res = send(api_method, url, params)

        render_response(res)
      end

      def request_body_master_params(method_name, params)
        params = send("params_for_#{method_name}", **params)

        params.is_a?(Hash) ? params.compact.to_json : params
      end

      def apply_search_params(url, search_params)
        return url if search_params.empty?

        search_params.each do |key, value|
          url += url.include?('?') ? "&#{key}=#{value}" : "?#{key}=#{value}"
        end

        url
      end
    end
  end
end
