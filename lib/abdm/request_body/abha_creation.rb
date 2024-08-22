module Abdm
  module RequestBody
    module AbhaCreation

      # Generates parameters for ABHA creation via Aadhaar
      # @param [String] login_id The login ID (Aadhaar number)
      # @return [String] JSON formatted parameters for ABHA creation via Aadhaar
      def params_for_abha_create_by_aadhaar(login_id)
        {
          txnId: "",
          scope: ["abha-enrol"],
          loginHint: "aadhaar",
          loginId: login_id,
          otpSystem: "aadhaar"
        }.to_json
      end

      # Generates parameters for OTP verification during Aadhaar-based ABHA creation
      # @param [String] otp_value The OTP value
      # @param [String] mobile_number The mobile number associated with Aadhaar
      # @return [String] JSON formatted parameters for OTP verification
      def params_for_verify_otp_by_aadhaar(otp_value, mobile_number)
        {
          authData: {
            authMethods: ['otp'],
            otp: {
              timeStamp: iso_timestamp,
              txnId: transaction_id,
              otpValue: otp_value,
              mobile: mobile_number
            }
          },
          consent: {
            code: 'abha-enrollment',
            version: '1.4'
          }
        }.to_json
      end

      # Generates parameters for initiating ABHA creation via Driving License and mobile verification
      # @param [String] login_id The login ID (usually mobile number)
      # @return [String] JSON formatted parameters for ABHA creation via DL
      def params_for_dl_mobile_number(login_id)
        {
          scope: ["abha-enrol", "mobile-verify", "dl-flow"],
          loginHint: "mobile",
          loginId: login_id,
          otpSystem: "abdm"
        }.to_json
      end

      # Generates parameters for OTP verification during DL-based ABHA creation
      # @param [String] otp_value The OTP value
      # @return [String] JSON formatted parameters for OTP verification
      def params_for_dl_otp_verify(otp_value)
        {
          scope: ["abha-enrol", "mobile-verify", "dl-flow"],
          authData: {
            authMethods: ["otp"],
            otp: {
              timeStamp: iso_timestamp,
              txnId: txn_id,
              otpValue: otp_value
            }
          }
        }.to_json
      end

      # Generates parameters to verify the Driving License document during ABHA creation
      # @param [String] document_id The document ID (Driving License number)
      # @return [String] JSON formatted parameters for DL document verification
      def params_for_verify_dl_document(document_id)
        {
          txnId: txn_id,
          documentType: "DRIVING_LICENCE",
          documentId: document_id,
          consent: {
            code: "abha-enrollment",
            version: "1.4"
          }
        }.to_json
      end

      # Generates parameters for updating mobile or email during ABHA creation
      # @param [String] login_hint The type of update ('mobile' or 'email')
      # @param [String] login_id The login ID (mobile number or email)
      # @return [String] JSON formatted parameters for updating mobile or email
      def params_for_update_mobile_email(login_hint, login_id)
        {
          txnId: transaction_id,
          scope: ["abha-enrol", find_mobile_or_email_verify(login_hint)],
          loginHint: login_hint,
          loginId: login_id,
          otpSystem: "abdm"
        }.to_json
      end

      # Generates parameters for OTP verification during mobile/email update
      # @param [String] login_hint The type of update ('mobile' or 'email')
      # @param [String] otp_value The OTP value
      # @return [String] JSON formatted parameters for OTP verification
      def params_for_verify_otp_mobile_email(login_hint, otp_value)
        {
          scope: ["abha-enrol", find_mobile_or_email_verify(login_hint)],
          authData: {
            authMethods: ["otp"],
            otp: {
              txnId: transaction_id,
              timeStamp: iso_timestamp,
              otpValue: otp_value
            }
          }
        }.to_json
      end

      # Generates parameters to create an ABHA address (ABHA number)
      # @param [String] address The ABHA address to create
      # @return [String] JSON formatted parameters for ABHA address creation
      def params_for_abha_create_abha_address(address)
        {
          txnId: transaction_id,
          abhaAddress: address,
          preferred: 1
        }.to_json
      end

      private

      # Determines whether to verify mobile or email based on login_hint
      # @param [String] login_hint 'mobile' or 'email'
      # @return [String] The appropriate verification scope
      def find_mobile_or_email_verify(login_hint)
        login_hint == 'email' ? 'email-verify' : 'mobile-verify'
      end
    end
  end
end
