
require 'abdm/request_body/hpr_creation'
require 'abdm/concerns/hpr/master_apis'

module ABDM
  class Hpr < Base
    include ABDM::RequestBody::HprCreation
    include Abdm::Hpr::MasterApis

    # Method to generate Aadhaar OTP for HPRID
    def generate_aadhaar_otp(params = {})
      send_request(__method__, params:, store_identifiers: 'transaction_id')
    end

    # Method to verify Aadhaar OTP for HPRID
    def verify_aadhaar_otp(params = {})
      send_request(__method__, params:)
    end

    # Method to check if HPID exists by Aadhaar
    def check_hpi_existence
      send_request(__method__)
    end

    # Method to verify if mobile number matches Aadhaar (via Demo Auth)
    def verify_mobile_number_matches_aadhaar(params = {})
      send_request(__method__, params:)
    end

    # Method to generate mobile OTP for HPRID (if Demo Auth failed)
    def generate_mobile_otp(params = {})
      send_request(__method__, params:)
    end

    # Method to verify mobile OTP for HPRID
    def verify_mobile_otp(params = {})
      send_request(__method__, params:)
    end

    # Method to get suggested username from HPRID
    def suggest_username
      send_request(__method__)
    end

    # Method to create HPRID
    def create_hprid(params = {})
      send_request(__method__, params:, store_identifiers: 'hpr_token')
    end

    # Method to search for a facility
    def search_facility(params = {})
      send_request(__method__, params:)
    end

    # Method to register a professional
    def register_professional(params = {})
      send_request(__method__, params:, klass: 'DOCTOR')
    end

    # Method to fetch documents list
    def fetch_document_list(params = {})
      send_request(__method__, params:, klass: 'DOCTOR')
    end

    # Method to upload a document
    def upload_document(params = {})
      send_request(__method__, params:, klass: 'DOCTOR')
    end

    # Method to Generate hprid token
    def generate_x_hprid_token(params = {})
      send_request(__method__, params:, store_identifiers: 'x_hprid_token')
    end

    private

    def send_request(method_name, klass: 'HPR', api_method: :post, params:, store_identifiers: nil)
      send_api_request(klass, method_name, api_method:, params:, store_identifiers:)
    end
  end
end
