module ABDM
  module RequestBody
    module AbhaCreation

      def params_for_generate_aadhaar_otp(aadhaar_number:)
        {
          txnId: "",
          scope: ["abha-enrol"],
          loginHint: "aadhaar",
          loginId: encrypt(aadhaar_number),
          otpSystem: "aadhaar"
        }
      end

      def params_for_enrol_abha(otp_value:, mobile_number:)
        {
          authData: {
            authMethods: ['otp'],
            otp: {
              txnId: transaction_id,
              otpValue: encrypt(otp_value),
              mobile: mobile_number
            }
          },
          consent: {
            code: 'abha-enrollment',
            version: '1.4'
          }
        }
      end

      def params_for_send_mobile_otp(mobile_number:)
        {
          txnId: transaction_id,
          scope: ['abha-enrol', 'mobile-verify'],
          loginHint: 'mobile',
          loginId: encrypt(mobile_number),
          otpSystem: 'abdm'
        }
      end

      def params_for_verify_mobile_otp(otp_value:)
        {
          scope: ['abha-enrol', 'mobile-verify'],
          authData: {
            authMethods: ['otp'],
            otp: {
              txnId: transaction_id,
              timeStamp: iso_timestamp,
              otpValue: encrypt(otp_value)
            }
          }
        }
      end

      def params_for_send_email_verification_link(email_id:)
        {
          txnId: transaction_id,
          scope: ['abha-profile', 'email-link-verify'],
          loginHint: 'email',
          loginId: encrypt(email_id),
          otpSystem: 'abdm'
        }
      end

      def params_for_create_custom_abha_address(abha_address:)
        {
          txnId: transaction_id,
          abhaAddress: abha_address,
          preferred:  1
        }
      end

      def params_for_generate_dl_otp(mobile_number:)
        {
          scope: ["abha-enrol", "mobile-verify", "dl-flow"],
          loginHint: "mobile",
          loginId: encrypt(mobile_number),
          otpSystem: "abdm"
        }
      end

      def params_for_verify_dl_otp(otp_value:)
        {
          scope: ["abha-enrol", "mobile-verify", "dl-flow"],
          authData: {
            authMethods: ["otp"],
            otp: {
              timeStamp: iso_timestamp,
              txnId: transaction_id,
              otpValue: encrypt(otp_value)
            }
          }
        }
      end

      def params_for_verify_dl_document(document_id:, first_name:, middle_name:, last_name:, date_of_birth:, gender:, encoded_front_side_photo:, encoded_back_side_photo:, address:, state:, district:, pin_code:)
        {
          txnId: transaction_id,
          documentType: "DRIVING_LICENCE",
          documentId: document_id,
          firstName: first_name,
          middleName: middle_name,
          lastName: last_name,
          dob: date_of_birth,
          gender: gender,
          frontSidePhoto: encoded_front_side_photo,
          backSidePhoto: encoded_back_side_photo,
          address: address,
          state: state,
          district: district,
          pinCode: pin_code,
          consent: {
            code: "abha-enrollment",
            version: "1.4"
          }
        }
      end
    end
  end
end
