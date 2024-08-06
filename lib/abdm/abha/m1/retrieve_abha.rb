# frozen_string_literal: true

module Abdm
  module Abha
    class M1::RetrieveAbha < Abdm::Base

      # Method to retrieve ABHA via Aadhaar OTP
      def via_aadhar(params)
        make_post_request(params)
      end

      # Method to retrieve ABHA via mobile OTP
      def via_mobile
        make_post_request(params)
      end

      # Method to retrieve ABHA via ABHA number
      def via_abha_number
        make_post_request(params)
      end

      # Method to retrieve ABHA via ABHA address
      def via_abha_address
        make_post_request(params)
      end

      # Method to retrieve ABHA via email
      def via_email
        make_post_request(params)
      end

      # Method to retrieve ABHA via password
      def via_password
        make_post_request(params)
      end

      # Method to verify OTP for Aadhaar
      def verify_otp(params)
        post('/api/v3/profile/login/verify', params)
      end

      private

      def make_post_request(params)
        post('/api/v3/profile/login/request/otp', params)
      end
    end
  end
end
