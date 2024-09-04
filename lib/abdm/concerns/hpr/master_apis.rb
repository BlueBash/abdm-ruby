require 'abdm/request_body/hpr_master_api_params'

module Abdm
  module Hpr
    module MasterApis
      include ABDM::RequestBody::HprMasterApiParams

      # Instance method to fetch System of Medicine
      def fetch_system_of_medicine
        send_master_api_request(__method__)
      end

      # Instance method to fetch Medical Councils
      def fetch_medical_councils
        send_master_api_request(__method__)
      end

      # Instance method to fetch Languages
      def fetch_languages
        send_master_api_request(__method__)
      end

      # Instance method to fetch Universities
      def fetch_universities
        send_master_api_request(__method__)
      end

      # Instance method to fetch Courses
      def fetch_courses
        send_master_api_request(__method__)
      end

      # Instance method to fetch Colleges
      def fetch_colleges
        send_master_api_request(__method__)
      end

      # Instance method to fetch Country Data
      def fetch_countries
        send_master_api_request(__method__)
      end

      # Instance method to fetch States
      def fetch_states
        send_master_api_request(__method__)
      end

      # Instance method to fetch Districts
      def fetch_districts
        send_master_api_request(__method__)
      end

      # Instance method to fetch Sub Districts
      def fetch_sub_districts
        send_master_api_request(__method__)
      end

      # Instance method to fetch Nurse Affiliated Boards
      def fetch_nurse_affiliated_boards
        send_master_api_request(__method__)
      end

      private

      def send_master_api_request(method_name)
        method_name = method_name.to_s.remove('fetch_')
        url         = "#{DOCTOR_BASE_URL}/#{MASTERAPI_PATH["hpr_#{method_name}"]}"
        params      = { body: request_body_params, headers: headers_params }
        res         = post(url, params)

        render_response(res)
      end

      def request_body_params
        params = public_send("params_for_#{method_name}")

        params.is_a?(Hash) ? params.compact.to_json : params
      end
    end
  end
end
