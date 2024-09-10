require 'abdm/request_body/hpr_master_api_params'

module Abdm
  module Hpr
    module MasterApis
      include ABDM::RequestBody::HprMasterApiParams

      # Instance method to fetch System of Medicine
      def fetch_system_of_medicine(params = {})
        send_request(__method__, params:)
      end

      # Instance method to fetch Medical Councils
      def fetch_medical_councils(params = {})
        send_request(__method__, params:)
      end

      # Instance method to fetch Languages
      def fetch_languages(params = {})
        send_request(__method__, params:)
      end

      # Instance method to fetch Universities
      def fetch_universities(params = {})
        send_request(__method__, params:)
      end

      # Instance method to fetch Colleges
      def fetch_colleges(params = {})
        send_request(__method__, params:)
      end

      # Instance method to fetch Courses
      def fetch_courses(params = {})
        send_request(__method__, params:)
      end

      # Instance method to fetch Country Data
      def fetch_countries(params = {})
        send_request(__method__, params:)
      end

      # Instance method to fetch States
      def fetch_states(params = {})
        send_request(__method__, params:)
      end

      # Instance method to fetch Districts
      def fetch_districts(params = {})
        send_request(__method__, params:)
      end

      # Instance method to fetch Sub Districts
      def fetch_sub_districts(params = {})
        send_request(__method__, params:)
      end

      # Instance method to fetch Nurse Affiliated Boards
      def fetch_nurse_affiliated_boards(params = {})
        send_request(__method__, params:)
      end

      private

      def send_request(method_name, params: {})
        klass = ABDMConfig[:environment] == 'sandbox' ? 'DOCTOR' : 'HPR'

        send_master_api_request(klass, method_name, params:)
      end
    end
  end
end
