# Registration in Health Facility Registry (HFR)

This guide explains how to register a health facility in the Health Facility Registry (HFR) using the `ABDM-ruby` gem.

## Step 1: Basic Facility Information API

The Basic Facility Information API is the first step to onboard your health facility into the HFR. This step checks for potential duplicates and, upon successful submission, returns a `trackingId` that is used for further updates.

### Method:
```ruby
basic_facility_information(facility_name:, ownership_code:, ownership_subtype_code:, facility_address_details:, facility_contact_information:, system_of_medicine_code:, facility_type_code:, facility_sub_type:, speciality_type_code: nil, type_of_service_code:, facility_operational_status:, facility_uploads:, timing_of_facilities: [], facility_address_proof: [], abdm_compliant_software: [])
```

### Parameters:

#### Required Parameters:
- `facility_name`: String - Name of the facility that is to be created in HFR. Must be an alphanumeric string that starts with an alphabet.
- `ownership_code`: String - Ownership of the facility. Use the accepted codes from the `get-master-data API` with type `OWNER`.
- `ownership_subtype_code`: String - Ownership subtype of the facility. Use codes from the `get-owner-subtype API`.
- `facility_address_details`: Object - JSON object to capture demographic data of the facility.
    - `country`: String - Country of the facility, default is India.
    - `stateLGDCode`: String - LGD code for the state where the facility is located.
    - `districtLGDCode`: String - LGD code for the district where the facility is located.
    - `subdistrictLGDCode`: String - LGD code for the subdistrict where the facility is located.
    - `addressLine1`: String - Line 1 of the facility's address.
    - `pincode`: String - 6-digit pin code of the facility.
    - `latitude`: String - Latitude of the facility.
    - `longitude`: String - Longitude of the facility.
- `facility_contact_information`: Object - JSON object to capture contact details of the facility.
- `system_of_medicine_code`: String - Code for the system of medicine followed by the facility (accepted codes from `get-master-data API` with type `MEDICINE`).
- `facility_type_code`: String - Facility type, as defined by HFR. Use codes from `fetch-facility-type API`.
- `facility_operational_status`: String - Operational status of the facility. Accepted codes from the `get-master-data API` with type `FACSTATUS`.

#### Optional Parameters:
- `facility_sub_type`: String - Facility subtype (if applicable). Use codes from `fetch-facility-sub-type API`.
- `speciality_type_code`: String (optional) - Specifies whether the facility offers single or multiple specialities. Accepted codes from `get-master-data API` with type `SPECIALITYTYPE`.
- `type_of_service_code`: String - Type of services offered by the facility. Use codes from `get-master-data API` with type `TYPESERVICE`.
- `facility_uploads`: Object - JSON object for facility uploads like photographs.
    - `facilityBoardPhoto`: Object - Contains the base64 image of the board photograph.
    - `facilityBuildingPhoto`: Object - Contains the base64 image of the building photograph.
- `timing_of_facilities`: Array - JSON object to capture facility timings if the facility is operational.
    - `workingDays`: String - Days the facility is operational.
    - `openingHours`: String - Opening hours of the facility (e.g., "10:00 AM - 2:00 PM" or "24*7").
- `facility_address_proof`: Array - JSON object for the address proof details (applicable for private facilities).
    - `addressProofType`: String - Type of address proof (accepted codes from `get-master-data API` with type `ADDRESSPROOF`).
    - `addressProofAttachment`: Object - Base64 encoded image of the address proof document.
- `abdm_compliant_software`: Array - JSON object for the ABDM-compliant software linked to the facility. Use codes from `get-software-details API`.

### Example:
```ruby
@client.basic_facility_information(
  facility_name: 'Sunshine Hospital',
  ownership_code: 'OWN123',
  ownership_subtype_code: 'SUB123',
  facility_address_details: {
    country: 'India',
    stateLGDCode: '10',
    districtLGDCode: '1001',
    subdistrictLGDCode: '100101',
    addressLine1: '123 Main Street',
    pincode: '110001',
    latitude: '28.6139',
    longitude: '77.2090'
  },
  facility_contact_information: {
    facilityContactNumber: '9876543210',
    facilityEmailId: 'info@sunshinehospital.com'
  },
  system_of_medicine_code: 'MED123',
  facility_type_code: 'HOSPITAL',
  facility_operational_status: 'Functional',
  timing_of_facilities: [
    { workingDays: 'Mon-Fri', openingHours: '9:00 AM - 5:00 PM' }
  ]
)
```

### Example Response:
```json
{
  "trackingId": "73478",
  "status": "Created",
  "message": "Facility created successfully. Please save the Facility Id returned.",
  "errorStatus": nil
}
```



## Step 2: Additional Information API

Once the **Basic Facility Information API** is called and the facility is marked as "Functional," the next step is to provide additional information about the facility using this API. The `trackingId` generated in the previous step is used for updating the dataset for the draft facility.


### Parameters:

#### Required Parameters:
- `tracking_id`: String - If you have followed the steps sequentially from **Step 1: Basic Facility Information API**, the `tracking_id` is already stored in the `@client` instance, so you do not need to pass it again. However, if you're directly using this API or working in another context, you must provide the `tracking_id` manually.

#### Optional Parameters:
- `has_dialysis_center`: String - Specifies whether the facility has a Dialysis Center (only applicable for certain facility types). Accepted codes from `get-master-data API` with type `GENERAL-INFO-OPTIONS`.
- `has_pharmacy`: String - Specifies whether the facility has a Pharmacy. Accepted codes from `get-master-data API` with type `GENERAL-INFO-OPTIONS`.
- `has_blood_bank`: String - Specifies whether the facility has a Blood Bank. Accepted codes from `get-master-data API` with type `GENERAL-INFO-OPTIONS`.
- `has_cath_lab`: String - Specifies whether the facility has a Cath Laboratory. Accepted codes from `get-master-data API` with type `GENERAL-INFO-OPTIONS`.
- `has_diagnostic_lab`: String - Specifies whether the facility has a Diagnostic Laboratory. Accepted codes from `get-master-data API` with type `GENERAL-INFO-OPTIONS`.
- `has_imaging_center`: String - Specifies whether the facility has an Imaging Center. Accepted codes from `get-master-data API` with type `GENERAL-INFO-OPTIONS`.

#### Imaging Center Details (If applicable):
- `services_by_imaging_center`: Array - If the facility has an Imaging Center, provide the services offered and the count of each.
  - `service`: String - Code of the imaging service offered. Accepted codes from `get-master-data API` with type `IMAGING`.
  - `count`: String - Number of equipment available for each service.

#### Optional Identifiers:
- `nhrr_id`: String - National Health Resource Repository Unique ID.
- `nin`: String - National Identification Number.
- `abpmjay_id`: String - Hospital ID allotted by the AB-PMJAY Hospital Empanelment Module.
- `rohini_id`: String - Rohini ID.
- `echs_id`: String - Unique ID for Ex-Servicemen Contributory Health Scheme.
- `cghs_id`: String - Unique ID for Central Government Health Scheme.
- `cea_registration`: String - CEA Registration Number.
- `state_insurance_scheme_id`: String - State Insurance Scheme ID (alphanumeric string).

### Example:
```ruby
@client.additional_information(
  tracking_id: '123456789',
  has_dialysis_center: 'Yes',
  has_pharmacy: 'No',
  has_blood_bank: 'Yes',
  has_cath_lab: 'No',
  has_diagnostic_lab: 'Yes',
  has_imaging_center: 'Yes',
  services_by_imaging_center: [
    { service: 'CT_SCAN', count: 2 }
  ],
  nhrr_id: 'NHRR123456',
  abpmjay_id: 'ABPMJAY123',
  cghs_id: 'CGHS123456',
  cea_registration: 'CEA123456',
  state_insurance_scheme_id: 'SIS123456'
)
```

### Example Response:
```json
{
  "message": "Additional information submitted successfully."
}
```



## Step 3: Detailed Information API

The **Detailed Information API** provides in-depth information about your facility's infrastructure, specializations, services, and other operational details. The `trackingId` generated from the **Basic Facility Information API** is required to update this data.

### Method:
```ruby
detailed_information(
  tracking_id:, specialities_list: [],
  count_hdu_beds_with_functional_ventilators: nil, count_ipd_beds_without_oxygen: nil, count_ipd_beds_with_oxygen: nil,
  count_icu_beds_with_ventilators: nil, count_icu_beds_without_ventilators: nil, count_hdu_beds_with_ventilators: nil,
  count_hdu_beds_without_ventilators: nil, total_number_of_ventilators:, count_day_care_beds_without_oxygen: nil,
  count_day_care_beds_with_oxygen: nil, count_dental_chairs: nil, total_number_of_beds:, is_jan_aushadhi_kendra: nil,
  jan_aushadhi_kendra_id: nil, drug_license_number: nil, pharmacy_gstin_number: nil, pharmacist_registration_number: nil,
  is_facility_registered_in_e_raktkosh: nil, e_raktosh_id: nil, blood_bank_license_number: nil, blood_storage_centers: nil,
  storage_centers_count: nil, blood_collected_per_annum: nil, blood_required_per_annum: nil, imaging_services: [{ service: nil, count: 0 }],
  diagnostic_services: []
)
```

### Parameters:

#### Required Parameters:
- `tracking_id`: String - Tracking ID generated from the **Basic Facility Information API**.
- `total_number_of_beds`: Integer - The total number of beds available at the facility. This should be equal to or greater than the sum of all other bed types.
- `total_number_of_ventilators`: Integer - The total number of ventilators available at the facility.

#### Optional Parameters:

##### Specialities:
- `specialities_list`: Array - A list of specialities provided by the facility, required for all facility types except Pharmacy, Diagnostic Labs, Imaging Center, Blood Bank, Dialysis Center, and Cath Labs.
  - `systemOfMedicineCode`: String - Code for the system of medicine.
  - `isSpecializationAvailable`: String - Whether specialization services are available (Y/N).
  - `specialities`: Array - List of specialization/service codes provided for the system of medicine.

##### Medical Infrastructure:
- `count_ipd_beds_without_oxygen`: Integer - Number of IPD beds (excluding ICU) without oxygen facilities.
- `count_ipd_beds_with_oxygen`: Integer - Number of IPD beds (excluding ICU) with oxygen facilities.
- `count_icu_beds_with_ventilators`: Integer - Number of ICU beds with ventilators.
- `count_icu_beds_without_ventilators`: Integer - Number of ICU beds without ventilators.
- `count_hdu_beds_with_functional_ventilators`: Integer - Number of HDU beds with functional ventilators.
- `count_hdu_beds_with_ventilators`: Integer - Number of HDU beds with ventilators.
- `count_hdu_beds_without_ventilators`: Integer - Number of HDU beds without ventilators.
- `count_day_care_beds_without_oxygen`: Integer - Number of daycare beds without oxygen facilities.
- `count_day_care_beds_with_oxygen`: Integer - Number of daycare beds with oxygen facilities.
- `count_dental_chairs`: Integer - Number of dental chairs (required if Dentistry is available).

##### Pharmacy Details:
- `is_jan_aushadhi_kendra`: String - Whether the facility has a Jan Aushadhi Kendra (Y/N).
- `jan_aushadhi_kendra_id`: String - Jan Aushadhi Kendra ID if applicable.
- `drug_license_number`: String - Drug license number of the facility.
- `pharmacy_gstin_number`: String - GSTIN number for the pharmacy.
- `pharmacist_registration_number`: String - Pharmacist registration number.

##### Blood Bank Details:
- `is_facility_registered_in_e_raktkosh`: String - Whether the facility is registered in e-Raktkosh (Y/N).
- `e_raktosh_id`: String - e-Raktkosh ID if applicable.
- `blood_bank_license_number`: String - Blood bank registration number.
- `blood_storage_centers`: String - Whether the facility has associated blood storage centers (Y/N).
- `storage_centers_count`: Integer - Number of blood storage centers (if applicable).
- `blood_collected_per_annum`: Integer - The number of blood units collected per annum.
- `blood_required_per_annum`: Integer - The required number of blood units per annum.

##### Imaging and Diagnostic Services:
- `imaging_services`: Array - List of imaging services provided by the facility, with the count of available equipment for each service.
  - `service`: String - Code of the imaging service (accepted codes from `get-master-data API` with type `IMAGING`).
  - `count`: Integer - Number of equipment for each imaging service.
- `diagnostic_services`: Array - List of diagnostic services provided by the facility (accepted codes from `get-master-data API` with type `DIAGNOSTIC`).

### Example:
```ruby
@client.detailed_information(
  tracking_id: '123456789',
  specialities_list: [
    {
      systemOfMedicineCode: 'MED123',
      isSpecializationAvailable: 'Y',
      specialities: ['CARDIOLOGY', 'NEUROLOGY']
    }
  ],
  count_ipd_beds_with_oxygen: 50,
  count_icu_beds_with_ventilators: 10,
  total_number_of_beds: 100,
  total_number_of_ventilators: 10,
  is_jan_aushadhi_kendra: 'Y',
  jan_aushadhi_kendra_id: 'JA123456',
  drug_license_number: 'DL123456',
  imaging_services: [
    { service: 'CT_SCAN', count: 2 }
  ],
  diagnostic_services: ['BLOOD_TEST', 'URINE_TEST']
)
```

### Example Response:
```json
{
  "message": "Detailed information submitted successfully."
}
```



## Step 4: Submit Facility Details API

The **Submit Facility Details API** is the final step in the process of on-boarding your facility into the HFR. Once submitted, your facility will move from the "Draft" stage to the "Submitted" stage for verification.

### Method:
```ruby
submit_facility(tracking_id: nil, source_of_information: nil, source_unique_id: nil)
```

### Parameters:

#### Required Parameters:
- `tracking_id`: String - If you have followed the steps sequentially from **Step 1: Basic Facility Information API**, the `tracking_id` is already stored in the `@client` instance, so you do not need to pass it again. However, if you're directly using this API or working in another context, you must provide the `tracking_id` manually.

#### Optional Parameters:
- `source_of_information`: String - The source of information for this facility. If left blank, the facility will be considered a "Submitted" entity. This value is provided by the HFR team.
- `source_unique_id`: String - A unique facility ID if it exists in the HPR or another data source.

### Example:
```ruby
@client.submit_facility(
  source_of_information: 'HFR_SOURCE',
  source_unique_id: 'UNIQUE123'
)
```

*Or, if you are not following the steps sequentially and need to pass the `tracking_id`:*
```ruby
@client.submit_facility(
  tracking_id: '123456789',
  source_of_information: 'HFR_SOURCE',
  source_unique_id: 'UNIQUE123'
)
```

### Example Response:
```json
{
  "message": "Facility submitted successfully."
}
```

---

## Conclusion

This guide covers **Step 4: Submit Facility Details API**, the final step in on-boarding your health facility using the `ABDM-ruby` gem. Once submitted, your facility details will be reviewed for verification. 

For more information, refer to the [Response Handling and Exception Management](#response-handling-and-exception-management) documentation.

---

This updated markdown file provides clarity on how the `tracking_id` is managed in the `@client` instance if the user follows the steps sequentially. Let me know if any further adjustments are needed!