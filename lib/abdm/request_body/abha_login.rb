module ABDM
  module RequestBody
    module AbhaLogin

      # Generates parameters for login via Aadhaar
      # @param [String] value The login ID (ABHA number)
      # @return [Hash] Parameters for login via Aadhaar
      def params_for_login_via_aadhaar(value)
        {
          scope: ['abha-login', 'aadhaar-verify'],
          loginHint: 'aadhaar',
          loginId: value,
          otpSystem: 'aadhaar'
        }
      end

      # Generates parameters for OTP verification during Aadhaar-based login
      # @param [String] value The OTP value
      # @return [Hash] Parameters for OTP verification
      def params_for_login_verify_aadhaar(value)
        {
          scope: ['abha-login', 'aadhaar-verify'],
          authData: {
            authMethods: ['otp'],
            otp: {
              txnId: transaction_id,
              otpValue: value
            }
          }
        }
      end

      # Generates parameters for login via ABHA number
      # @param [String] value The login ID (ABHA number)
      # @return [Hash] Parameters for login via ABHA
      def params_for_login_via_abha_number(value)
        {
          scope: ['abha-login', 'mobile-verify'],
          loginHint: 'abha-number',
          loginId: value,
          otpSystem: 'abdm'
        }
      end

      # Generates parameters for OTP verification during ABHA-based login
      # @param [String] value The OTP value
      # @return [Hash] Parameters for OTP verification
      def params_for_login_verify_abha_number(value)
        {
          scope: ['abha-login', 'mobile-verify'],
          authData: {
            authMethods: ['otp'],
            otp: {
              txnId: transaction_id,
              otpValue: value
            }
          }
        }
      end

      # Generates parameters for login via mobile number
      # @param [String] value The mobile number
      # @return [Hash] Parameters for login via mobile
      def params_for_login_via_mobile(value)
        {
          scope: ['abha-login', 'mobile-verify'],
          loginHint: 'mobile',
          loginId: value,
          otpSystem: 'abdm'
        }
      end

      # Generates parameters for OTP verification during mobile-based login
      # @param [String] value The OTP value
      # @return [Hash] Parameters for OTP verification
      def params_for_login_verify_mobile(value)
        {
          scope: ['abha-login', 'mobile-verify'],
          authData: {
            authMethods: ['otp'],
            otp: {
              txnId: transaction_id,
              otpValue: value
            }
          }
        }
      end

      # Generates parameters to verify user with ABHA number
      # @param [String] abha_number The ABHA number to verify
      # @return [Hash] Parameters for verifying user
      def params_for_verify_user(abha_number)
        {
          ABHANumber: abha_number,
          txnId: transaction_id
        }
      end

      # Generates parameters for login via password
      # @param [String] abha_number The ABHA number
      # @param [String] password The user's password
      # @return [Hash] Parameters for password-based login
      def params_for_login_via_password(abha_number, password)
        {
          scope: ['abha-login', 'password-verify'],
          authData: {
            authMethods: ['password'],
            password: {
              ABHANumber: abha_number,
              password: password
            }
          }
        }
      end
    end
  end
end
