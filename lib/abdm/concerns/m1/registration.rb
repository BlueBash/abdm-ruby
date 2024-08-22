require 'abdm/request_body/abha_creation'

module Abdm::M1
  module Registration
    include Abdm::RsaEncryption
    include Abdm::RequestBody::AbhaCreation

    def by_aadhaar(number)
      number  = encrypt(number)
      options = {
        body: params_for_abha_create_by_aadhaar(number),
        headers: headers_params(request_id: true, time_stamp: true)
      }

      uri = "#{ABHA_BASE_URL}/abha/api/v3/enrollment/request/otp"
      res = post(uri, options)

      render_response(res, store_identifiers: 'transaction_id')
    end

    def verify_aadhaar_otp(otp_value, mobile_number)
      otp_value = encrypt(otp_value)
      options   = {
        body: params_for_verify_otp_by_aadhaar(otp_value, mobile_number),
        headers: headers_params(request_id: true, time_stamp: true)
      }

      uri = "#{ABHA_BASE_URL}/abha/api/v3/enrollment/enrol/byAadhaar"
      res  = post(uri, options)

      render_response(res, store_identifiers: 'session_token')
    end

    def by_driving_license(params)
    end

    def verify_driving_license_otp(params)
    end

    def verify_driving_license_document(params)
    end

    def update_mobile_or_email(login_hint, value)
      value   = encrypt(value)
      options = {
        body: params_for_update_mobile_email(login_hint, value),
        headers: headers_params(request_id: true, time_stamp: true)
      }

      uri = "#{ABHA_BASE_URL}/abha/api/v3/enrollment/request/otp"
      res = post(uri, options)

      render_response(res)
    end

    def verify_otp_update_mobile_or_email(login_hint, otp_value)
      otp_value = encrypt(otp_value)
      options   = {
        body: params_for_verify_otp_mobile_email(login_hint, otp_value),
        headers: headers_params(request_id: true, time_stamp: true)
      }

      uri  = "#{ABHA_BASE_URL}/abha/api/v3/enrollment/auth/byAbdm"
      res  = post(uri, options)

      render_response(res)
    end

    def generate_address
      options = {
        headers: headers_params(request_id: true, time_stamp: true, txn_id: true)
      }

      uri = "#{ABHA_BASE_URL}/abha/api/v3/enrollment/enrol/suggestion"
      res = get(uri, options)

      render_response(res)
    end

    def create_address(address)
      options = {
        body: params_for_abha_create_abha_address(address),
        headers: headers_params(request_id: true, time_stamp: true)
      }

      uri = "#{ABHA_BASE_URL}/abha/api/v3/enrollment/enrol/abha-address"
      res = post(uri, options)

      render_response(res)
    end
  end
end
