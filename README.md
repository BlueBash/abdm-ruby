
# ABDM-ruby

## Overview

`ABDM-ruby` is an open-source Ruby gem developed by [Bluebash](https://www.bluebash.co/), designed to simplify integration with the Ayushman Bharat Digital Mission (ABDM) APIs. This gem provides a set of tools and utilities to manage health records, generate ABHA numbers, and perform other operations through the ABDM ecosystem.

## About Bluebash

As a leader in the development of Electronic Health Record (EHR) systems, **Bluebash** is uniquely positioned to leverage the capabilities of the ABHA and ABDM. Our EHR solutions are designed to seamlessly integrate with the ABHA framework, ensuring that healthcare providers can easily access and manage patient records. By aligning our systems with ABDM’s milestones, we are enhancing the overall quality of healthcare services in India through effective EHR integration.

## Features

- Seamless integration with ABDM APIs.
- Supports operations like generating ABHA numbers, managing health records, and more.
- Easy-to-use configuration and setup.
- Class and object-based design for modular and reusable code.

## Documentation

For detailed information on how to install, configure, and use the `ABDM-ruby` gem, please refer to the documentation in the `docs` directory. Below is a breakdown of the available documentation:

### 1. **Installation and Configuration**
- [Installation Guide](/docs/1_installation.md)
- [Configuration Guide](/docs/2_configuration.md)
- [Response and Exception Handling](/docs/3_response_and_exception_handling.md)
- [Contributing Guidelines](/docs/4_contributing.md)

### 2. **ABHA (Ayushman Bharat Health Account)**
- [Creation via Aadhaar](/docs/abha/1_creation_via_aadhaar.md)
- [Creation via Driving License](/docs/abha/2_creation_via_driving_license.md)

### 3. **HFR (Health Facility Registry)**
- **Onboarding Process**:
  - [Basic Facility Information](/docs/hfr/on-boarding-hfr/1_basic_facility_info.md)
  - [Additional Information](/docs/hfr/on-boarding-hfr/2_additional_info.md)
  - [Detailed Information](/docs/hfr/on-boarding-hfr/3_detailed_info.md)
  - [Submit Facility Details](/docs/hfr/on-boarding-hfr/4_submit_facility_details.md)

### 4. **HPR (Health Professional Registry)**
- **Registration Process**:
  - [Generate Aadhaar OTP](/docs/hpr/registration/1_generate_aadhaar_otp.md)
  - [Verify Aadhaar OTP](/docs/hpr/registration/2_verify_aadhaar_otp.md)
  - [Check HPI ID Existence](/docs/hpr/registration/3_check_hpi_id_existence.md)
  - [Verify Mobile Number Matches Aadhaar](/docs/hpr/registration/4_verify_mobile_number_matches_aadhaar.md)
  - [Generate Mobile OTP](/docs/hpr/registration/5_1_generate_mobile_otp.md)
  - [Verify Mobile OTP](/docs/hpr/registration/5_2_verify_mobile_otp.md)
  - [Suggest Username](/docs/hpr/registration/6_suggest_username.md)
  - [Create HPRID](/docs/hpr/registration/7_create_hprid.md)
  - [Search Facility](/docs/hpr/registration/8_search_facility.md)
  - [Register Professional](/docs/hpr/registration/9_register_professional.md)
  - [Retrieve Document List](/docs/hpr/registration/10_retrieve_document_list.md)
  - [Upload Documents](/docs/hpr/registration/11_upload_documents.md)

### 5. **Master/Utility APIs**
- **HFR Master Data**:
  - [Master Types](/docs/master_or_utility_apis/hfr/1_master_types.md)
  - [Master Data](/docs/master_or_utility_apis/hfr/2_master_data.md)
  - [LGD States](/docs/master_or_utility_apis/hfr/3_lgd_states.md)
  - [Facility Types](/docs/master_or_utility_apis/hfr/4_facility_types.md)
  - [Owner Subtypes](/docs/master_or_utility_apis/hfr/5_owner_subtypes.md)
  - [Specialities](/docs/master_or_utility_apis/hfr/6_specialities.md)
  - [Facility Subtypes](/docs/master_or_utility_apis/hfr/7_facility_subtypes.md)
  - [ABDM Complaint Software](/docs/master_or_utility_apis/hfr/8_abdm_complaint_software.md)

- **HPR Master Data**:
  - [System of Medicine](/docs/master_or_utility_apis/hpr/1_system_of_medicine.md)
  - [Medical Councils](/docs/master_or_utility_apis/hpr/2_medical_council.md)
  - [Languages](/docs/master_or_utility_apis/hpr/3_languages.md)
  - [Universities](/docs/master_or_utility_apis/hpr/4_universities.md)
  - [Colleges](/docs/master_or_utility_apis/hpr/5_colleges.md)
  - [Courses](/docs/master_or_utility_apis/hpr/6_courses.md)
  - [Countries](/docs/master_or_utility_apis/hpr/7_countries.md)
  - [States](/docs/master_or_utility_apis/hpr/8_states.md)
  - [Districts](/docs/master_or_utility_apis/hpr/9_districts.md)
  - [Sub-districts](/docs/master_or_utility_apis/hpr/10_sub_districts.md)
  - [Nurse Affiliated Boards](/docs/master_or_utility_apis/hpr/11_nurse_affiliated_boards.md)


## Quick Start

To quickly get started with `ABDM-ruby`, follow the [Installation Guide](docs/1_installation.md) to install the gem and set up the basic configuration. For detailed usage instructions and examples, see the **Usage Documentation**.

## Contributing

We welcome contributions to enhance the capabilities of the `ABDM-ruby` gem! Please refer to our [Contribution Guide](docs/3_contributing.md) for more details on how to contribute.

## License

`ABDM-ruby` is open-source software licensed under the [MIT license](LICENSE).

## Contact

For any questions or support, please contact us at [info@bluebash.co](mailto:info@bluebash.co).

## Conclusion

The Ayushman Bharat Digital Mission (ABDM) marks a significant step forward in India's healthcare system, driving digital transformation and enhancing the accessibility, efficiency, and quality of healthcare services. By integrating digital tools and technologies, ABDM has created a unified healthcare ecosystem that benefits both patients and healthcare providers. **Bluebash** is proud to contribute to this mission by developing advanced EHR systems that align with ABDM's vision, ensuring a seamless and secure healthcare experience for all citizens. As India moves towards a more digital future, ABDM stands as a testament to the power of technology in revolutionizing healthcare.
