# HFR On-boarding Process

The on-boarding process for a health facility in the Health Facility Registry (HFR) involves multiple steps. This guide outlines the API endpoints and procedures required to successfully onboard a facility. Ensure to follow the sequence of API calls as outlined to complete the registration process.


## Step 1: Basic Facility Information API

The Basic Facility Information API is the first step to onboard your health facility into the HFR. This step checks for potential duplicates and, upon successful submission, returns a `trackingId` that is used for further updates.


## Method:
```ruby
basic_facility_information(
  hpr_id:,
  password:,
  facility_name:,
  ownership_code:,
  ownership_subtype_code:,
  ownership_subtype_code_2:,
  country:,
  state_LGD_code:,
  district_LGD_code:,
  subdistrict_LGD_code:,
  facility_region:,
  village_city_town_lgd_code:,
  address_line_1:,
  address_line_2:,
  pincode:,
  latitude:,
  longitude:,
  facility_contact_number:,
  facility_email_id:,
  facility_landline_number:,
  facility_std_code:,
  website_link:,
  system_of_medicine_code:,
  facility_type_code:,
  facility_subtype:,
  speciality_type_code:,
  type_of_service_code:,
  facility_operational_status:,
  facility_uploads:,
  timings_of_facility:,
  facility_address_proof:,
  abdm_compliant_software:
)
```

## Parameters

  - `hpr_id` (String, required): The Healthcare Professional ID number used for authentication. This should be the unique identifier assigned to the healthcare professional.

  - `password` (String, required): The password associated with the Healthcare Professional ID. This should be the correct password for the specified `hpr_id`.

  - `facility_name`: (String, required) - The official name of the health facility, must be an alphanumeric string starting with a letter.

  - `ownership_code`: (String, required) - Specifies the ownership classification of the facility, such as private, government, etc. Accepted codes can be found in the `get-master-data API` with `type='OWNER'`.

  - `ownership_subtype_code`: (String, required) - A more detailed classification of the ownership, such as state government or trust.

  - `ownership_subtype_code_2`: (String, optional) - Used for central government ownership subtype if applicable.

  - `country`: (String, optional, default: "India") - Specifies the country of the facility, default is India.

  - `state_LGD_code`: (String, required) - The LGD code for the state where the facility is located.

  - `district_LGD_code`: (String, required) - The LGD code for the district where the facility is located.

  - `subdistrict_LGD_code`: (String, required) - The LGD code for the subdistrict where the facility is located.

  - `address_line_1`: (String, required) - The primary address line of the facility.

  - `address_line_2`: (String, optional) - The secondary address line for the facility.

  - `facility_region`: (String, optional) - Indicates whether the facility is in a rural (R) or urban (U) area.

  - `village_city_town_lgd_code`: (String, optional) - The LGD code for the village, city, or town where the facility is located.

  - `pincode`: (String, required) - The postal pin code of the facility.

  - `latitude`: (required) - The geographical latitude of the facility.

  - `longitude`: (required) - The geographical longitude of the facility.

  - `facility_contact_number`: (String, optional) - A valid 10-digit mobile number for contacting the facility.

  - `facility_email_id`: (String, optional) - The official email address for the facility.

  - `facility_landline_number`: (String, optional) - The landline number for the facility.

  - `facility_std_code`: (String, optional) - The STD code for the landline number.

  - `website_link`: (String, optional) - The website link of the facility, if applicable.

  - `system_of_medicine_code`: (String, required) - The code representing the system of medicine practiced at the facility (e.g., Allopathy, Ayurveda).

  - `facility_type_code`: (String, required) - The code representing the type of facility (e.g., hospital, clinic, dispensary).

  - `facility_subtype`: (String, optional) - Further classification of the facility type (e.g., multi-speciality hospital).

  - `speciality_type_code`: (String, optional) - The type of speciality offered by the facility (e.g., single speciality, multiple specialities).

  - `type_of_service_code`: (String, optional) - Code representing the type of services offered (e.g., OPD, IPD).

  - `facility_operational_status`: (String, required) - The current operational status of the facility (e.g., functional, under construction).

  - `facility_uploads`: (Object, optional) - A JSON object containing any facility photographs (e.g., board photo, building photo).
    - `facilityBoardPhoto` (Object) - A JSON object that contains the board photograph of the facility.
      - `name`: (String) - The name or description of the board photo.

      - `value`: (String) - The base64-encoded image of the facility's board photograph.

    - `facilityBuildingPhoto` (Object) - A JSON object that contains the building photograph of the facility.
      - `name`: (String) - The name or description of the building photo.

      - `value`: (String) - The base64-encoded image of the facility's building photograph.

  - `timings_of_facility`: (Array, optional) - An array that contains the working days and hours of operation for the facility.
    - `workingDays`: (String) - Specifies the day(s) the facility operates (e.g., Mon, Tue, Wed). Use a short format for the day.

    - `openingHours`: (String) - The working hours for that specific day in a "HH:MM AM/PM - HH:MM AM/PM" format.

  - `facility_address_proof`: (Array, optional) - A JSON object that contains the address proof documents for the facility.
    - `addressProofType`: (String) - The type of address proof document (e.g., utility bill, rent agreement). This must match the types defined in the system.

    - `addressProofAttachment` (Object) - A JSON object that contains the address proof document.
      - `name`: (String) - The name or description of the document (e.g., Electricity Bill, Rent Agreement).

      - `value`: (String) - The base64-encoded image of the address proof document.

  - `abdm_compliant_software`: (Array, optional) - A list of ABDM-compliant software codes linked to the facility.
    - `existingSoftwares`: (Array) - A list of unique IDs representing the software(s) already being used by the facility. These are predefined codes for software registered with the system.

    - `anyOther`: (String) - Any other software that the facility uses which is not listed in the predefined software codes. This must be an alphanumeric string.

## Request Body

```ruby
@client.basic_facility_information(
  hpr_id: "test_id@hpr.abdm",
  password: "password@123",
  facility_name: 'Eye Care Center',
  ownership_code: 'G',
  ownership_subtype_code: 'SubType1',
  ownership_subtype_code_2: 'MOHF',
  country: 'India',
  state_LGD_code: '35',
  district_LGD_code: '202',
  subdistrict_LGD_code: '4023',
  address_line_1: 'Sushrut Multispeciality Clinic',
  address_line_2: 'Gandhi Chowk, Opp. Dr. Kazi Hospital',
  facility_region: 'R',
  village_city_town_lgd_code: '534829',
  pincode: '441304',
  latitude: '2.123456',
  longitude: '7.987654',
  facility_contact_number: '9876543210',
  facility_email_id: 'info@eyecare.com',
  facility_landline_number: '07122567890',
  facility_std_code: '0712',
  website_link: 'http://eyecarecenter.com',
  system_of_medicine_code: 'M',
  facility_type_code: '5',
  facility_subtype: 'Speciality',
  speciality_type_code: 'SP1',
  type_of_service_code: 'OPD',
  facility_operational_status: 'Functional',
  facility_uploads: {
    facilityBoardPhoto: { name: 'Facility Board', value: 'base64_board_image' },
    facilityBuildingPhoto: { name: 'Facility Building', value: 'base64_building_image' }
  },
  timings_of_facility: [
    { workingDays: 'Tue', openingHours: '1:00 AM - 2:00 PM' },
    { workingDays: 'Wed', openingHours: '1:00 AM - 2:00 PM' }
  ],
  facility_address_proof: [
    { addressProofType: 'Utility Bill', addressProofAttachment: { name: 'Electricity Bill', value: 'base64_proof_image' } }
  ],
  abdm_compliant_software: [
    { existingSoftwares: ['12121221', '12121111'], anyOther: 'Other Software' }
  ]
)
```


## Response Body
```json
{
  "trackingId": "73478",
  "status": "Created",
  "message": "Facility created successfully. Please save the Facility Id returned.",
  "errorStatus": ""
}
```


You've successfully completed the `Basic Facility Information API` step. The next task is to provide detailed data on your facility’s infrastructure and services using the `Detailed Information API`. This will help the Health Facility Registry accurately assess your facility’s capabilities and complete the onboarding process.