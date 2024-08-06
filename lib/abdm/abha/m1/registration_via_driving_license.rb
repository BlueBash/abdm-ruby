module Abdm
  module Abha
    module M1
      class RegistrationViaDrivingLicense < Abdm::Base

        # Create ABHA via Driving License - Verify Mobile OTP
        # This API verifies the OTP sent to the mobile number as part of the process to create an ABHA account using a Driving License.
        def create_abha_via_dl_verify_otp(params)
          post("#{ABHA_BASE_URL}/api/v3/enrollment/auth/byAbdm", params)
        end

        # Create ABHA via Driving License - Verify DL Document
        # This API validates the driving license document with NEPIX, creates a new account, and generates an enrolment number.
        def create_abha_via_dl_verify_document(params)
          post("#{ABHA_BASE_URL}/api/v3/enrollment/enrol/byDocument", params)
        end

        # Update the mobile number using OTP
        # This method sends a request to generate an OTP that will be sent to a new mobile number for updating the user's contact information.
        def update_mobile_number(params)
          post("#{ABHA_BASE_URL}/api/v3/enrollment/request/otp", params)
        end
      end
    end
  end
end
