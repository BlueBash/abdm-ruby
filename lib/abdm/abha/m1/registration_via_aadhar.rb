module Abdm
  module Abha
    module M1
      class RegistrationViaAadhar < Abdm::Base
        ABHA_BASE_URL = "".freeze

        # Generate Aadhaar OTP on Aadhaar linked mobile number
        # This method sends a request to the API to generate an OTP that will be sent to the mobile number linked with the provided Aadhaar number.
        def generate_otp(params)
          post("#{ABHA_BASE_URL}/api/v3/enrollment/request/otp", params)
        end

        # Verify the Aadhaar OTP
        # This method verifies the OTP sent to the Aadhaar linked mobile number, completing the enrollment step.
        def verify_otp(params)
          post("#{ABHA_BASE_URL}/api/v3/enrollment/enrol/byAadhaar", params)
        end

        # Update the mobile number using OTP
        # This method sends a request to generate an OTP that will be sent to a new mobile number for updating the user's contact information.
        def update_mobile_number(params)
          post("#{ABHA_BASE_URL}/api/v3/enrollment/request/otp", params)
        end

        # Verify the mobile OTP for updating mobile number
        # This method verifies the OTP sent to the new mobile number, completing the mobile number update process.
        def verify_mobile_otp(params)
          post("#{ABHA_BASE_URL}/api/v3/enrollment/auth/byAbdm", params)
        end

        # Update the email ID using OTP
        # This method sends a request to generate an OTP that will be sent to a new email address for updating the user's contact information.
        def update_email_id(params)
          post("#{ABHA_BASE_URL}/api/v3/enrollment/request/otp", params)
        end

        # Verify the email OTP for updating email ID
        # This method verifies the OTP sent to the new email address, completing the email ID update process.
        def verify_email_otp(params)
          post("#{ABHA_BASE_URL}/api/v3/enrollment/auth/byAbdm", params)
        end

        # Suggest ABHA address
        # This method sends a request to suggest an ABHA (Ayushman Bharat Health Account) address based on the provided prefix.
        def suggest_abha_address(params)
          post("#{ABHA_BASE_URL}/api/v3/enrollment/suggestAbhaAddress", params)
        end

        # Create ABHA address
        # This method sends a request to create an ABHA (Ayushman Bharat Health Account) address based on the chosen ABHA address.
        def create_abha_address(params)
          post("#{ABHA_BASE_URL}/api/v3/enrollment/createAbhaAddress", params)
        end
      end
    end
  end
end
