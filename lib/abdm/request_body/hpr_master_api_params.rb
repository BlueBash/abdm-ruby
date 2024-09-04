module ABDM
  module RequestBody
    module HprMasterApiParams

      # Method to generate parameters for fetching Medical Councils
      def params_for_medical_councils(identifier: nil, medical_councils_name: nil, system_of_medicine: nil)
        {
          identifier: identifier,
          name: medical_councils_name,
          systemOfMedicine: system_of_medicine
        }
      end

      # Method to generate parameters for fetching Languages
      def params_for_languages(language_name: nil)
        { name: language_name }
      end

      # Method to generate parameters for fetching Universities
      def params_for_universities(university_name: nil)
        { name: university_name }
      end

      # Method to generate parameters for fetching Colleges
      def params_for_colleges(identifier: nil, category: nil, subcategory: nil)
        {
          identifier: identifier,
          category: category,
          subcategory: subcategory
        }
      end

      # Method to generate parameters for fetching Courses
      def params_for_courses(system_of_medicine: nil, hpr_type: nil, course_name: nil)
        {
          systemOfMedicine: system_of_medicine,
          hprType: hpr_type,
          name: course_name
        }
      end

      # Method to generate parameters for fetching Countries
      def params_for_countries(country_name: nil)
        { name: country_name }
      end

      # Method to generate parameters for fetching States
      def params_for_states(state_name: nil)
        { name: state_name }
      end

      # Method to generate parameters for fetching Districts
      def params_for_districts(state_name: nil)
        { state: state_name }
      end

      # Method to generate parameters for fetching Sub Districts
      def params_for_sub_districts(state_name: nil)
        { state: state_name }
      end

      # Method to generate parameters for fetching Nurse Affiliated Boards
      def params_for_nurse_affiliated_boards(identifier: nil)
        { identifier: identifier }
      end
    end
  end
end
