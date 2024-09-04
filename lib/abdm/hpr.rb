
require 'abdm/request_body/hpr_creation'
require 'abdm/concerns/hpr/master_apis'

module ABDM
  class Hpr < Base
    include ABDM::RequestBody::HprCreation
    include Abdm::Hpr::MasterApis

    # Method to generate Aadhaar OTP for HPRID
    def generate_aadhaar_otp(options = {})
      send_api_request(__method__, options, store_identifiers: 'transaction_id')
    end

    # Method to verify Aadhaar OTP for HPRID
    def verify_aadhaar_otp(options = {})
      send_api_request(__method__, options)
    end

    # Method to check if HPID exists by Aadhaar
    def check_hpi_existence
      send_api_request(__method__)
    end

    # Method to verify if mobile number matches Aadhaar (via Demo Auth)
    def verify_mobile_number_matches_aadhaar(options = {})
      send_api_request(__method__, options)
    end

    # Method to generate mobile OTP for HPRID (if Demo Auth failed)
    def generate_mobile_otp(options = {})
      send_api_request(__method__, options)
    end

    # Method to verify mobile OTP for HPRID
    def verify_mobile_otp(options = {})
      send_api_request(__method__, options)
    end

    # Method to get suggested username from HPRID
    def suggest_username
      send_api_request(__method__)
    end

    # Method to create HPRID
    def create_hprid(options = {})
      send_api_request(__method__, options, store_identifiers: 'hpr_token')
    end

    # Method to search for a facility
    def search_facility(options = {})
      send_api_request(__method__, options, base_url: HFR_BASE_URL)
    end

    # Method to register a professional
    def register_professional(options = {})
      send_api_request(__method__, options, base_url: DOCTOR_BASE_URL)
    end

    # Method to fetch documents list
    def fetch_document_list
      send_api_request(__method__, options, base_url: DOCTOR_BASE_URL)
    end

    # Method to upload a document
    def upload_document(options = {})
      send_api_request(__method__, options, base_url: DOCTOR_BASE_URL)
    end

    # Method to Generate hprid token
    def generate_x_hprid_token(params = {})
      send_api_request(__method__, params, store_identifiers: 'x_hprid_token')
    end

    private

    def send_api_request(method_name, options = {}, store_identifiers: nil, base_url: HPR_BASE_URL)
      url    = "#{base_url}/#{HPR_PATH_URLS[method_name]}"
      params = {
        body: public_send("params_for_#{method_name}", **options).compact.to_json,
        headers: headers_params
      }

      res  = post(url, params)

      render_response(res, store_identifiers:)
    end
  end
end
