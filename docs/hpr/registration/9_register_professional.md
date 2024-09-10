# Register Professional API

Use this API to register a doctor or nurse in the system. The payload must include user details.


## Important Notes:

1. For this API, you need to add your `hpr_id` and `password` manually in the configuration file `initializers/abdm.rb`. This will automatically generate the `hpr_token`, which will be submitted with the request body. Users only need to provide the other required data parameters.

2. Specify `doctor` or `nurse` in the `health_professional_type` field. Invalid or missing values will result in an error.

3. For `chooseWorkStatus` values of "1" or "2", the `facilityDeclarationData` field is mandatory. If `chooseWorkStatus` is "0" and facility data is unavailable, remove `facilityDeclarationData`.

4. If `health_professional_type` is `doctor` and `isPermanentOrRenewable` is "Renewable", `renewableDueDate` is mandatory. If `isPermanentOrRenewable` is "Permanent", `renewableDueDate` is not required.

5. For `nurse`, `isPermanentOrRenewable` and `renewableDueDate` are not required.



## Parameters:

- `profile_photo`: (String, optional) - URL or Base64 encoded string of the profile photo.

- `health_professional_type`: (String, required) - Type of health professional, either "doctor" or "nurse".

- `official_mobile_code`: (String, optional) - Country code for the mobile number.

- `official_mobile`: (String, required) - Official mobile number.

- `official_mobile_status`: (Integer, optional) - Status of the mobile number (0 or 1).

- `official_email`: (String, optional) - Official email address.

- `official_email_status`: (Integer, optional) - Status of the email address (0 or 1).

- `visible_profile_picture`: (Integer, optional) - Visibility of the profile picture (0 or 1).

- `profile_visible_to_public`: (Integer, optional) - Whether the profile is visible to the public (1 for yes).

- `personal_information`: (Hash, object).

    - `salutation`: (Integer, required) - Salutation (e.g., Mr., Dr.).

    - `firstName`: (String, required) - First name of the professional.

    - `middleName`: (String, optional) - Middle name of the professional.

    - `lastName`: (String, optional) - Last name of the professional.

    - `fatherName`: (String, optional) - Father's name.

    - `motherName`: (String, optional) - Mother's name.

    - `spouseName`: (String, optional) - Spouse's name.

    - `nationality`: (String, required) - Nationality ID from master data.

    - `placeOfBirthState`: (String, optional) - State of birth, ISO code from master data.

    - `district`: (String, optional) - District of birth, ISO code from master data.

    - `subDistrict`: (String, optional) - Sub-district of birth, ISO code from master data.

    - `city`: (String, optional) - City of birth, ISO code from master data.

    - `languagesSpoken`: (String, required) - Languages spoken, e.g., "1,5" for two languages.

- `address_as_per_kyc`: (String, Optional) - address is as per KYC

- `communication_address`: (Hash, object)

    - `isCommunicationAddressAsPerKYC`: (Integer, optional) - Indicates if communication address is as per KYC (0 or 1).

    - `address`: (String, required if `isCommunicationAddressAsPerKYC` is 0) - Communication address.

    - `name`: (String, required) - Name of the address field.

    - `country`: (Integer, required) - Country ID from master data.

    - `state`: (Integer, required) - State ID from master data.

    - `district`: (Integer, required) - District ID from master data.

    - `subDistrict`: (Integer, optional) - Sub-district ID from master data.

    - `city`: (Integer, optional) - City ID from master data.

    - `postalCode`: (Integer, required) - Postal code.

- `contact_information`: (Hash, Object)

    - `publicMobileNumber`: (String, optional) - Public mobile number.

    - `publicMobileNumberCode`: (String, optional) - Country code for public mobile number.

    - `publicMobileNumberStatus`: (Integer, optional) - Status of the public mobile number (0 or 1).

    - `landLineNumber`: (String, optional) - Landline number.

    - `landLineNumberCode`: (String, optional) - Country code for landline number.

    - `publicEmail`: (String, optional) - Public email address.

    - `publicEmailStatus`: (Integer, optional) - Status of the public email address (0 or 1).

- `registration_academic`: (Hash, object)

    - `category`: (Integer, required) - Doctor or nurse sub-category code from master data.

    - `registrationData`: (Array of Hash, Object)

        - `registeredWithCouncil`: (String, required) - Council ID from master data.

        - `registrationNumber`: (String, required) - Registration number.

        - `registrationCertificate`: (String, optional) - Certificate of registration.

        - `isNameDifferentInCertificate`: (Integer, optional) - Indicates if the name is different in the certificate (0 or 1).

        - `proofOfNameChangeCertificate`: (String, optional) - Proof of name change if applicable.

        - `registrationDate`: (String, optional) - Registration date.

        - `isPermanentOrRenewable`: (String, optional) - If the professional is a doctor, specify if permanent or renewable.

        - `renewableDueDate`: (String, optional) - Due date for renewal if applicable.

        - `categoryId`: (Integer, required) - Category ID for the degree or diploma obtained.

        - `qualifications`: (Array of Hash, Object)

            - `nameOfDegreeOrDiplomaObtained`: (Integer, required) - Degree or diploma ID from master data.

            - `country`: (Integer, required) - Country ID where the degree was awarded.

            - `state`: (Integer, required) - State ID where the degree was awarded.

            - `college`: (Integer, required) - College ID from master data.

            - `university`: (Integer, required) - University ID from master data.

            - `monthOfAwardingDegreeDiploma`: (String, optional) - Month when the degree or diploma was awarded.

            - `yearOfAwardingDegreeDiploma`: (Date, required) - Year when the degree or diploma was awarded.

            - `degreeCertificate`: (String, optional) - Degree certificate.

            - `isNameDifferentInCertificate`: (Integer, optional) - Indicates if the name is different in the certificate (0 or 1).

            - `proofOfNameChangeCertificate`: (String, optional) - Proof of name change if applicable.

- `current_work_details`: (Hash, object)

    - `currentlyWorking`: (Integer, required) - Indicates if currently working (0 or 1).

    - `purposeOfWork`: (String, required) - Purpose of work, refer to master data for options.

    - `chooseWorkStatus`: (Integer, required) - Work status (0 for not working, 1 for private, 2 for government only).

    - `reasonForNotWorking`: (String, optional) - Reason for not working if `currentlyWorking` is 0.

    - `certificateAttachment`: (String, optional) - Certificate attachment.

    - `facilityDeclarationData`: (Hash, Object)

        - `facilityId`: (String, optional) - Facility ID if applicable.

        - `facilityName`: (String, optional) - Facility name if `facilityId` is not provided.

        - `facilityAddress`: (String, optional) - Facility address if `facilityId` is not provided.

        - `facilityPincode`: (String, optional) - Facility pin code if `facilityId` is not provided.

        - `state`: (Integer, optional) - State ID if `facilityId` is not provided.

        - `district`: (Integer, optional) - District ID if `facilityId` is not provided.

        - `facilityType`: (String, optional) - Facility type if `facilityId` is not provided.

        - `facilityDepartment`: (String, optional) - Facility department if `facilityId` is provided.

        - `facilityDesignation`: (String, optional) - Facility designation if `facilityId` is provided.


## Method
```ruby
register_professional(
  profile_photo:,
  health_professional_type:,
  official_mobile:,
  official_mobile_code:,
  official_mobile_status:,
  official_email:,
  official_email_status:,
  visible_profile_picture:,
  profile_visible_to_public:,
  personal_information: {},
  address_as_per_kyc:,
  communication_address: {},
  contact_information: {},
  registration_academic: {},
  current_work_details: {}
)
```


## Request Body:

```ruby
@client.register_professional(
  health_professional_type: "doctor",
  official_mobile: "9739121212",
  official_mobile_code: "+91",
  official_mobile_status: "1",
  official_email: "example@example.com",
  official_email_status: "1",
  visible_profile_picture: "1",
  profile_visible_to_public: "1",
  personal_information: {
    salutation: 1,
    firstName: "John",
    middleName: "",
    lastName: "Doe",
    fatherName: "father name",
    motherName: "mother name",
    spouseName: "",
    nationality: "356",
    placeOfBirthState: "Assam",
    district: "",
    subDistrict: "",
    city: "",
    languagesSpoken: "1,5"
  },
  communication_address: {
    isCommunicationAddressAsPerKYC: "0",
    address: "#9/1",
    name: "Bikash Choudhury",
    country: "356",
    state: "29",
    district: "36",
    subDistrict: "",
    city: "",
    postalCode: "571225"
  },
  contact_information: {
    publicMobileNumber: "",
    publicMobileNumberCode: "",
    publicMobileNumberStatus: "",
    landLineNumber: "",
    landLineNumberCode: "",
    publicEmail: "",
    publicEmailStatus: ""
  },
  registration_academic: {
    category: "1",
    registrationData: [
      {
        registeredWithCouncil: "7",
        registrationNumber: "123455",
        registrationCertificate: "",
        isNameDifferentInCertificate: "0",
        proofOfNameChangeCertificate: "",
        registrationDate: "2023-02-15",
        isPermanentOrRenewable: "Renewable",
        renewableDueDate: "2023-02-15",
        categoryId: "1",
        qualifications: [
          {
            nameOfDegreeOrDiplomaObtained: "3841",
            country: "356",
            state: "28",
            college: "76",
            university: "35",
            monthOfAwardingDegreeDiploma: "",
            yearOfAwardingDegreeDiploma: "2020",
            degreeCertificate: "",
            isNameDifferentInCertificate: "0",
            proofOfNameChangeCertificate: ""
          }
        ]
      }
    ]
  },
  current_work_details: {
    currentlyWorking: "1",
    purposeOfWork: "Practice",
    chooseWorkStatus: "1",
    reasonForNotWorking: "",
    certificateAttachment: "",
    facilityDeclarationData: {
      facilityId: "",
      facilityName: "",
      facilityAddress: "",
      facilityPincode: "",
      state: "",
      district: "",
      facilityType: "",
      facilityDepartment: "",
      facilityDesignation: ""
    }
  }
)
```

## Response Body:

```json
{
  "referenceNumber": "85d083e9-abae-4272-a409-17502206884a",
  "status": true,
  "hprId": "71-1221-1212-1212",
  "message": "Congratulations! Your profile has been submitted successfully for verification."
}
```