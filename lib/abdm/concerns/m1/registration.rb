require 'abdm/request_body/abha_creation'

module ABDM::M1
  module Registration
    include ABDM::RequestBody::AbhaCreation

    def generate_aadhaar_otp(params)
      send_request(__method__, params:, store_identifiers: 'transaction_id')
    end

    def resend_aadhaar_otp(params)
      generate_aadhaar_otp(params)
    end

    def enrol_abha(params)
      send_request(__method__, params:, store_identifiers: 'session_token')
    end

    def send_mobile_otp(params)
      send_request(__method__, params:)
    end

    def verify_mobile_otp(params)
      send_request(__method__, params:)
    end

    def send_email_verification_link(params)
      send_request(__method__, params:)
    end

    def get_abha_address_suggestion
      send_request(__method__)
    end

    def create_custom_abha_address(params)
      send_request(__method__, params:)
    end

    def generate_dl_otp(params)
      send_request(__method__, params:, store_identifiers: 'transaction_id')
    end

    def verify_dl_otp(params)
      send_request(__method__, params:)
    end

    def verify_dl_document(params)
      send_request(__method__, params:)
    end
  end
end
