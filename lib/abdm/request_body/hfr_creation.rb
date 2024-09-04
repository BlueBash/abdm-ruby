# lib/abdm/request_body/hfr_creation.rb

module ABDM
  module RequestBody
    module HfrCreation

      # Method to generate parameters for the Search Facility API
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

      # Method to generate parameters for Onboard Facility API
      def params_for_basic_facility_information(facility_name:, ownership_code:, ownership_subtype_code:, facility_address_details:, facility_contact_information:, system_of_medicine_code:, facility_type_code:, facility_sub_type:, speciality_type_code: nil, type_of_service_code:, facility_operational_status:, facility_uploads:, timing_of_facilities: [], facility_address_proof: [], abdm_compliant_software: [])
        {
          facilityId: '',
          facilityInformation: {
            facilityName: facility_name,
            ownershipCode: ownership_code,
            ownershipSubTypeCode: ownership_subtype_code,
            facilityAddressDetails: facility_address_details,
            facilityContactInformation: facility_contact_information,
            systemOfMedicineCode: system_of_medicine_code,
            facilityTypeCode: facility_type_code,
            facilitySubType: facility_sub_type,
            specialityTypeCode: speciality_type_code,
            typeOfServiceCode: type_of_service_code,
            facilityOperationalStatus: facility_operational_status,
            facilityUploads: facility_uploads,
            timingsOfFacility: timing_of_facilities,
            facilityAddressProof: facility_address_proof,
            abdmCompliantSoftware: abdm_compliant_software
          }
        }
      end

      # Method to generate parameters for the Additional Information API
      def params_for_additional_information(tracking_id: @tracking_id, has_dialysis_center: nil, has_pharmacy: nil, has_blood_bank: nil, has_cath_lab: nil, has_diagnostic_lab: nil, has_imaging_center: nil, services_by_imaging_center: [{ service: "", count: 0 }], nhrr_id: nil, nin: nil, abpmjay_id: nil, rohini_id: nil, echs_id: nil, cghs_id: nil, cea_registration: nil, state_insurance_scheme_id: nil)
        {
          trackingId: tracking_id,
          generalInformation: {
            hasDialysisCenter: has_dialysis_center,
            hasPharmacy: has_pharmacy,
            hasBloodBank: has_blood_bank,
            hasCathLab: has_cath_lab,
            hasDiagnosticLab: has_diagnostic_lab,
            hasImagingCenter: has_imaging_center,
            servicesByImagingCenter: services_by_imaging_center,
          },
          linkedProgramIds: {
            nhrrId: nhrr_id,
            nin: nin,
            abpmjayId: abpmjay_id,
            rohiniId: rohini_id,
            echsId: echs_id,
            cghsId: cghs_id,
            ceaRegistration: cea_registration,
            stateInsuranceSchemeId: state_insurance_scheme_id
          }
        }
      end

      # Method to generate parameters for the Detailed Information API
      def params_for_detailed_information(
        tracking_id: @tracking_id,
        specialities_list: [],
        count_hdu_beds_with_functional_ventilators: nil,
        count_ipd_beds_without_oxygen: nil,
        count_ipd_beds_with_oxygen: nil,
        count_icu_beds_with_ventilators: nil,
        count_icu_beds_without_ventilators: nil,
        count_hdu_beds_with_ventilators: nil,
        count_hdu_beds_without_ventilators: nil,
        total_number_of_ventilators: ,
        count_day_care_beds_without_oxygen: nil,
        count_day_care_beds_with_oxygen: nil,
        count_dental_chairs: nil,
        total_number_of_beds:,
        is_jan_aushadhi_kendra: nil,
        jan_aushadhi_kendra_id: nil,
        drug_license_number: nil,
        pharmacy_gstin_number: nil,
        pharmacist_registration_number: nil,
        is_facility_registered_in_e_raktkosh: nil,
        e_raktosh_id: nil,
        blood_bank_license_number: nil,
        blood_storage_centers: nil,
        storage_centers_count: nil,
        blood_collected_per_annum: nil,
        blood_required_per_annum: nil,
        imaging_services: [{ service: nil, count: 0 }],
        diagnostic_services: []
      )
        {
          trackingId: @tracking_id,
          specialities: specialities_list,
          medicalInfrastructure: {
            countHDUBedsWithFunctionalVentilators: count_hdu_beds_with_functional_ventilators,
            countIPDBedsWithoutOxygen: count_ipd_beds_without_oxygen,
            countIPDBedsWithOxygen: count_ipd_beds_with_oxygen,
            countICUBedsWithVentilators: count_icu_beds_with_ventilators,
            countICUBedsWithoutVentilators: count_icu_beds_without_ventilators,
            countHDUBedsWithVentilators: count_hdu_beds_with_ventilators,
            countHDUBedsWithoutVentilators: count_hdu_beds_without_ventilators,
            totalNumberOfVentilators: total_number_of_ventilators,
            countDayCareBedsWithoutOxygen: count_day_care_beds_without_oxygen,
            countDayCareBedsWithOxygen: count_day_care_beds_with_oxygen,
            countDentalChairs: count_dental_chairs,
            totalNumberOfBeds: total_number_of_beds
          },
          pharmacyDetails: {
            isJanAushadhiKendra: is_jan_aushadhi_kendra,
            janAushadhiKendraId: jan_aushadhi_kendra_id,
            drugLicenseNumber: drug_license_number,
            pharmacyGstinNumber: pharmacy_gstin_number,
            pharmacistRegistrationNumber: pharmacist_registration_number
          },
          bloodBankDetails: {
            isFacilityRegisteredInERaktkosh: is_facility_registered_in_e_raktkosh,
            eRaktoshId: e_raktosh_id,
            bloodBankLicenseNumber: blood_bank_license_number,
            bloodStorageCenters: blood_storage_centers,
            storageCentersCount: storage_centers_count,
            bloodCollectedPerAnnum: blood_collected_per_annum,
            bloodRequiredPerAnnum: blood_required_per_annum
          },
          imagingServices: imaging_services,
          diagnosticServices: diagnostic_services
        }
      end

      def params_for_submit_facility(tracking_id: @tracking_id, source_of_information: nil, source_unique_id: nil)
        {
          trackingId: tracking_id,
          sourceOfInformation: source_of_information,
          sourceUniqueID: source_unique_id
        }
      end
    end
  end
end
