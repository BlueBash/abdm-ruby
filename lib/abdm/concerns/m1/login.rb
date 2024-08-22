# frozen_string_literal: true

require 'abdm/request_body/abha_login'

module Abdm::M1
  module Login
    include Abdm::RsaEncryption
    include Abdm::RequestBody::AbhaLogin

    %w[aadhaar mobile abha_number].each do |method|
      define_method("login_via_#{method}") do |value|
        value = encrypt(value)

        options = {
          body: public_send("params_for_login_via_#{method}", value).to_json,
          headers: headers_params(request_id: true, time_stamp: true)
        }

        url = "#{ABHA_BASE_URL}/abha/api/v3/profile/login/request/otp"
        res = post(url, options)

        render_response(res, store_identifiers: 'transaction_id')
      end



      define_method("login_otp_verify_for_#{method}") do |value|
        value = encrypt(value)

        options = {
          body: public_send("params_for_login_verify_#{method}", value).to_json,
          headers: headers_params(request_id: true, time_stamp: true)
        }

        url = "#{ABHA_BASE_URL}/abha/api/v3/profile/login/verify"
        res = post(url, options)

        store_identifiers = (method == 'mobile') ? 't_token' : 'x_token'

        render_response(res, store_identifiers:)
      end
    end

    def verify_login_user(abha_number)
      options  = {
        body: params_for_verify_user(abha_number).to_json,
        headers: headers_params(request_id: true, time_stamp: true, abdm_t_token: true)
      }

      url = "#{ABHA_BASE_URL}/abha/api/v3/profile/login/verify/user"
      res = post(url, options)

      render_response(res, store_identifiers: 'x_token')
    end


    def login_via_password(abha_number, password)
      password    = encrypt(password)

      options = {
        body: params_for_login_via_password(abha_number, password).to_json,
        headers: headers_params(request_id: true, time_stamp: true)
      }

      url = "#{ABHA_BASE_URL}/abha/api/v3/profile/login/verify"
      res = post(url, options)

      render_response(res, store_identifiers: 'x_token')
    end
  end
end
