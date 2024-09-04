module ABDM
  module RequestBody
    module HfrMasterApiParams

      # Method to generate parameters for fetching Facility Types
      # @param ownership_code [String] Ownership code of the facility
      # @param system_of_medicine_code [String, nil] System of medicine code (optional)
      def params_for_facility_type(ownership_code:, system_of_medicine_code: nil)
        {
          ownershipCode: ownership_code,
          systemOfMedicineCode: system_of_medicine_code
        }
      end

      # Method to generate parameters for fetching Owner Subtypes
      # @param ownership_code [String] Ownership code of the facility
      # @param owner_subtype_code [String, nil] Ownership subtype code (optional)
      def params_for_owner_subtypes(ownership_code:, owner_subtype_code: nil)
        {
          ownershipCode: ownership_code,
          ownerSubtypeCode: owner_subtype_code
        }
      end

      # Method to generate parameters for fetching Specialities
      # @param system_of_medicine_code [String] System of medicine code
      def params_for_specialities(system_of_medicine_code:)
        {
          systemOfMedicineCode: system_of_medicine_code
        }
      end

      # Method to generate parameters for fetching Facility Subtypes
      # @param facility_type_code [String] Facility type code
      def params_for_facility_subtype(facility_type_code:)
        {
          facilityTypeCode: facility_type_code
        }
      end
    end
  end
end
