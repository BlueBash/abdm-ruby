module ABDM
  module RequestBody
    module HprCreation
      # Method to generate parameters for generating Aadhaar OTP
      # @param aadhaar_number [String] Aadhaar number of the user
      def params_for_generate_aadhaar_otp(aadhaar_number:)
        { aadhaar: aadhaar_number }
      end

      # Method to generate parameters for verifying Aadhaar OTP
      # @param otp_value [String] OTP value received by the user
      def params_for_verify_aadhaar_otp(otp_value:)
        {
          domainName: "@hpr.abdm",
          idType: "hpr_id",
          otp: otp_value,
          restrictions: "",
          txnId: transaction_id
        }
      end

      # Method to generate parameters for checking HPI existence
      def params_for_check_hpi_existence
        {
          txnId: transaction_id,
          preverifiedCheck: true
        }
      end

      # Method to generate parameters for verifying if a mobile number matches Aadhaar
      # @param mobile_number [String] Mobile number of the user
      def params_for_verify_mobile_number_matches_aadhaar(mobile_number:)
        {
          txnId: transaction_id,
          mobileNumber: mobile_number
        }
      end

      # Method to generate parameters for generating mobile OTP
      # @param mobile_number [String] Mobile number to send OTP
      def params_for_generate_mobile_otp(mobile_number:)
        {
          mobile: mobile_number,
          txnId: transaction_id
        }
      end

      # Method to generate parameters for verifying mobile OTP
      # @param otp_value [String] OTP value received by the user
      def params_for_verify_mobile_otp(otp_value:)
        {
          otp: otp_value,
          txnId: transaction_id
        }
      end

      # Method to generate parameters for suggesting a username
      def params_for_suggest_username
        { txnId: transaction_id }
      end

      # Method to generate parameters for creating an HPR ID
      # @param email [String] Email of the user
      # @param first_name [String] First name of the user
      # @param middle_name [String, nil] Middle name of the user (optional)
      # @param last_name [String] Last name of the user
      # @param password [String] Password for the HPR ID
      # @param profile_photo [String] Base64 encoded profile photo
      # @param state_code [String] State code
      # @param dist_code [String] District code
      # @param pin_code [String] Pin code
      # @param hpr_id [String] HPR ID
      # @param hp_category_code [String] Health professional category code
      # @param hp_subcategory_code [String] Health professional subcategory code
      # @param notify_user [Boolean] Whether to notify the user (default: true)
      def params_for_create_hprid(email:, first_name:, middle_name: nil, last_name:, password:, profile_photo:, state_code:, dist_code:, pin_code:, hpr_id:, hp_category_code:, hp_subcategory_code:, notify_user: true)
        {
          idType: "hpr_id",
          domainName: "@hpr.abdm",
          email: email,
          firstName: first_name,
          middleName: middle_name,
          lastName: last_name,
          password: encrypt(password),
          profilePhoto: profile_photo,
          stateCode: state_code,
          districtCode: dist_code,
          pincode: pin_code,
          txnId: transaction_id,
          hprId: hpr_id,
          hpCategoryCode: hp_category_code,
          hpSubCategoryCode: hp_subcategory_code,
          notifyUser: notify_user
        }
      end

      # Method to generate parameters for searching for a facility
      # @param ownership_code [String] Ownership code of the facility
      # @param state_lgd_code [String] State LGD code
      # @param district_lgd_code [String, nil] District LGD code (optional)
      # @param subdistrict_lgd_code [String, nil] Subdistrict LGD code (optional)
      # @param pincode [String, nil] Pincode (optional)
      # @param facility_name [String] Facility name to search for
      # @param facility_id [String, nil] Facility ID (optional)
      # @param page [Integer] Page number for pagination (default: 1)
      # @param results_per_page [Integer] Results per page (default: 10)
      def params_for_search_facility(ownership_code:, state_lgd_code:, district_lgd_code: nil, subdistrict_lgd_code: nil, pincode: nil, facility_name:, facility_id: nil, page: 1, results_per_page: 10)
        {
          ownershipCode: ownership_code,
          stateLGDCode: state_lgd_code,
          districtLGDCode: district_lgd_code,
          subDistrictLGDCode: subdistrict_lgd_code,
          pincode: pincode,
          facilityName: facility_name,
          facilityId: facility_id,
          page: page,
          resultsPerPage: results_per_page
        }
      end

      # Method to generate parameters for registering a professional
      # @param hpr_token [String] HPR token
      # @param health_professional_type [String] Health professional type
      # @param official_mobile [String] Official mobile number
      # @param official_mobile_code [String, nil] Official mobile code (optional)
      # @param official_mobile_status [String, nil] Official mobile status (optional)
      # @param official_email [String, nil] Official email (optional)
      # @param official_email_status [String, nil] Official email status (optional)
      # @param visible_profile_picture [String, nil] Visible profile picture (optional)
      # @param profile_visible_to_public [Boolean, nil] Whether profile is visible to public (optional)
      # @param personal_information [Hash] Personal information
      # @param communication_address [Hash] Communication address
      # @param contact_information [Hash] Contact information
      # @param registration_academic [Hash] Registration academic details
      # @param current_work_details [Hash] Current work details
      def params_for_register_professional(
        health_professional_type:, official_mobile:, official_mobile_code: nil, official_mobile_status: nil, official_email: nil, official_email_status: nil, visible_profile_picture: nil, profile_visible_to_public: nil, personal_information:, communication_address:, contact_information:, registration_academic:, current_work_details:
      )
        {
          hprToken: hpr_token,
          practitioner: {
            profilePhoto: "",
            healthProfessionalType: health_professional_type,
            officialMobileCode: official_mobile_code,
            officialMobile: official_mobile,
            officialMobileStatus: official_mobile_status,
            officialEmail: official_email,
            officialEmailStatus: official_email_status,
            visibleProfilePicture: visible_profile_picture,
            profileVisibleToPublic: profile_visible_to_public,
            personalInformation: personal_information,
            addressAsPerKYC: "",
            communicationAddress: communication_address,
            contactInformation: contact_information,
            registrationAcademic: registration_academic,
            currentWorkDetails: current_work_details
          }
        }
      end

      # Method to generate parameters for fetching the professional document list
      def params_for_fetch_document_list
        { hprid: hpr_id }
      end

      # Method to generate parameters for uploading documents
      # @param documents [Array<Hash>] List of documents to upload
      def params_for_upload_documents(documents: [])
        {
          hpr_token: hpr_token,
          documents: documents
        }
      end

      def params_for_generate_x_hprid_token(hpr_id:, password:)
        {
          hprId: hpr_id,
          password: password
        }
      end
    end
  end
end
