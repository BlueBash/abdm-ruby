
if ABDMConfig[:environment] == 'sandbox'
  ABHA_BASE_URL = 'https://abhasbx.abdm.gov.in'.freeze
  GATEWAY_URL = 'https://dev.abdm.gov.in/gateway/v0.5/sessions'.freeze
  HPR_BASE_URL = 'https://hpridsbx.abdm.gov.in'.freeze
  HFR_BASE_URL = 'https://facilitysbx.abdm.gov.in'.freeze
  DOCTOR_BASE_URL = 'https://doctorsbx.abdm.gov.in'.freeze
else
  ABHA_BASE_URL = 'https://abha.abdm.gov.in'.freeze
  GATEWAY_URL = 'https://live.abdm.gov.in/gateway/v0.5/sessions'.freeze
  HPR_BASE_URL = 'https://hprid.abdm.gov.in'.freeze
  HFR_BASE_URL = 'https://facility.abdm.gov.in'.freeze
  DOCTOR_BASE_URL = 'https://hpr.abdm.gov.in'.freeze
end


PATH_URLS = {
  hpr_generate_aadhaar_otp: 'api/v1/registration/aadhaar/generateOtp',
  hpr_verify_aadhaar_otp: 'api/v1/registration/aadhaar/verifyOTP',
  hpr_check_hpi_existence: 'api/v2/registration/aadhaar/checkHpIdAccountExist',
  hpr_verify_mobile_number_matches_aadhaar: 'api/v1/registration/aadhaar/demographicAuthViaMobile',
  hpr_generate_mobile_otp: 'api/v1/registration/aadhaar/generateMobileOTP',
  hpr_verify_mobile_otp: 'api/v1/registration/aadhaar/verifyMobileOTP',
  hpr_suggest_username: 'api/v1/registration/aadhaar/hpid/suggestion',
  hpr_create_hprid: 'api/v1/registration/aadhaar/createHprIdWithPreVerified',
  hpr_search_facility: 'FacilityManagement/v1.5/facility/search',
  hpr_register_professional: 'apis/v1/doctors/register-professional-new',
  hpr_fetch_document_list: 'apis/v1/doctors/fetch-documents-list',
  hpr_upload_document: 'apis/v1/uploads/upload-document',
  hpr_generate_x_hprid_token: 'api/v1/auth/authPassword',

  hfr_search_facility: 'FacilityManagement/v1.5/facility/search',
  hfr_basic_facility_information: 'FacilityManagement/v1.5/facility/basic-information',
  hfr_additional_information: 'FacilityManagement/v1.5/facility/additional-information',
  hfr_detailed_information: 'FacilityManagement/v1.5/facility/detailed-information',
  hfr_submit_facility: 'FacilityManagement/v1.5/facility/submit-facility',
}.as_json.freeze

MASTERAPI_PATH = {
  hpr_system_of_medicine: 'apis/v1/masters/system-of-medicines',
  hpr_medical_councils: 'apis/v1/masters/medical-councils',
  hpr_languages: 'apis/v1/masters/languages',
  hpr_universities: 'apis/v1/masters/universites',
  hpr_colleges: 'apis/v1/masters/colleges',
  hpr_courses: 'apis/v1/masters/courses',
  hpr_countries: 'apis/v1/masters/countries',
  hpr_states: 'apis/v1/masters/states',
  hpr_districts: 'apis/v1/masters/district',
  hpr_sub_districts: 'apis/v1/masters/sub-districts',
  hpr_nurse_affiliated_boards: 'apis/v1/masters/affiliated-board',

  hfr_master_types: 'FacilityManagement/v1.5/facility/get-master-types',
  hfr_master_data: 'FacilityManagement/v1.5/facility/get-master-data',
  hfr_lgd_states: 'FacilityManagement/v1.5/facility/lgd/states',
  hfr_facility_type: 'FacilityManagement/v1.5/facility/fetch-facility-type',
  hfr_owner_subtypes: 'FacilityManagement/v1.5/facility/get-owner-subtype',
  hfr_specialities: 'FacilityManagement/v1.5/facility/get-specialities',
  hfr_facility_subtype: 'FacilityManagement/v1.5/facility/fetch-facility-Sub-type',
  hfr_abdm_compliant_software: 'FacilityManagement/v1.5/facility/software-details',
}.as_json.freeze
