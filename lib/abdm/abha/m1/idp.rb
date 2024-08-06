# frozen_string_literal: true

module Abdm
  module Abha
    # M1::Idp class handles authentication and verification related operations for ABHA
    class M1::Idp < Abdm::Base

      # Authenticate user with "Demo" scope
      def demo_authentication(params)
        post('/api/v3/identity/authentication', params)
      end

      # Authenticate user with "HIECM" scope and generate access token
      def hiecm_authentication(params)
        post('/api/v3/identity/authentication', params)
      end

      # Authenticate user and generate OTP
      def abha_number_authentication(params)
        post('/api/v3/identity/authentication', params)
      end

      # Authenticate user and generate OTP based on address
      def abha_address_authentication(params)
        post('/api/v3/identity/authentication', params)
      end

      # Verify the OTP provided by the user
      def verify_otp(params)
        post('/api/v3/identity/verify', params)
      end

      # Get all ABHA addresses linked to the provided mobile number
      def get_all_abha_addresses(mobile_number)
        get("/api/v3/identity/mobile/all/address/#{mobile_number}")
      end

      # Get all ABHA numbers linked to the provided mobile number
      def get_all_abha_numbers(mobile_number)
        get("/api/v3/identity/mobile/all/number/#{mobile_number}")
      end

      # Get all ABHA details linked to the provided mobile number
      def get_all_abha_details(mobile_number)
        get("/api/v3/identity/mobile/details/#{mobile_number}")
      end
    end
  end
end
