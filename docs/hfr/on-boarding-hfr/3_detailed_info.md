# Step 3: Detailed Information API

The `Detailed Information API` provides in-depth information about your facility's infrastructure, specializations, services, and other operational details. The `trackingId` generated from the `Basic Facility Information API` is required to update this data.


## Method:
```ruby
detailed_information(
  tracking_id:,
  specialities_list:,
  count_hdu_beds_with_functional_ventilators:,
  count_ipd_beds_without_oxygen:,
  count_ipd_beds_with_oxygen:,
  count_icu_beds_with_ventilators:,
  count_icu_beds_without_ventilators:,
  count_hdu_beds_with_ventilators:,
  count_hdu_beds_without_ventilators:,
  total_number_of_ventilators: ,
  count_day_care_beds_without_oxygen:,
  count_day_care_beds_with_oxygen:,
  count_dental_chairs:,
  total_number_of_beds:,
  is_jan_aushadhi_kendra:,
  jan_aushadhi_kendra_id:,
  drug_license_number:,
  pharmacy_gstin_number:,
  pharmacist_registration_number:,
  is_facility_registered_in_e_raktkosh:,
  e_raktosh_id:,
  blood_bank_license_number:,
  blood_storage_centers:,
  storage_centers_count:,
  blood_collected_per_annum:,
  blood_required_per_annum:,
  imaging_services:,
  diagnostic_services:
)
```

## Parameters

- `tracking_id`: (String, required) - If you have followed the steps sequentially from `Step 1: Basic Facility Information API`, the `tracking_id` is already stored in the `@client` instance, so you do not need to pass it again. However, if you're directly using this API or working in another context, you must provide the `tracking_id` manually.

- `specialities_list`: (Array of Hashes, optional) - A list of specialities provided by the facility for each system of medicine. Each entry includes:
  - `systemOfMedicineCode`: (String, required) - The code for the system of medicine (e.g., Ayurveda, Allopathy). Accepted codes are specified in the `get-master-data API` with `type='MEDICINE'`.
  - `isSpecializationAvalaible`: (String, required) - Indicates whether specializations are offered for this system of medicine. Accepted values are "Y" (Yes) or "N" (No).
  - `specialities`: (Array of Strings, optional) - A list of specialization/service codes offered for this system of medicine. Codes are specified in the `get-specialities API`.

- `count_hdu_beds_with_functional_ventilators`: (Integer, optional) - The number of High Dependency Unit (HDU) beds with functional ventilators available at the facility.

- `count_ipd_beds_without_oxygen`: (Integer, optional) - The number of Inpatient Department (IPD) beds without an oxygen facility.

- `count_ipd_beds_with_oxygen`: (Integer, optional) - The number of Inpatient Department (IPD) beds with an oxygen facility.

- `count_icu_beds_with_ventilators`: (Integer, optional) - The number of Intensive Care Unit (ICU) beds equipped with ventilators.

- `count_icu_beds_without_ventilators`: (Integer, optional) - The number of ICU beds without ventilators.

- `count_hdu_beds_with_ventilators`: (Integer, optional) - The number of HDU beds with ventilators.

- `count_hdu_beds_without_ventilators`: (Integer, optional) - The number of HDU beds without ventilators.

- `total_number_of_ventilators`: (Integer, required) - The total number of ventilators available at the facility, including those in ICUs and HDUs.

- `count_day_care_beds_without_oxygen`: (Integer, optional) - The number of day-care beds without an oxygen supply.

- `count_day_care_beds_with_oxygen`: (Integer, optional) - The number of day-care beds with an oxygen supply.

- `count_dental_chairs`: (Integer, optional) - The number of dental chairs in the facility (applicable if dental services are provided).

- `total_number_of_beds`: (Integer, required) - The total number of beds available in the facility, including IPD, ICU, HDU, etc.

- `is_jan_aushadhi_kendra`: (String, optional) - Specifies whether the facility is a Jan Aushadhi Kendra (government-supported pharmacy). Accepted values are "Y" (Yes) or "N" (No).

- `jan_aushadhi_kendra_id`: (String, optional) - The unique ID of the facility if it is a Jan Aushadhi Kendra.

- `drug_license_number`: (String, optional) - The drug license number of the pharmacy at the facility.

- `pharmacy_gstin_number`: (String, optional) - The GSTIN number associated with the pharmacy at the facility.

- `pharmacist_registration_number`: (String, optional) - The registration number of the pharmacist associated with the facility.

- `is_facility_registered_in_e_raktkosh`: (String, optional) - Indicates whether the facility is registered in e-Raktkosh (national blood bank information management system). Accepted values are "Y" (Yes) or "N" (No).

- `e_raktosh_id`: (String, optional) - The unique ID of the facility in the e-Raktkosh system (required if registered).

- `blood_bank_license_number`: (String, optional) - The license number of the blood bank at the facility.

- `blood_storage_centers`: (String, optional) - Indicates whether there are blood storage centers associated with the facility. Accepted values are "Y" (Yes) or "N" (No).

- `storage_centers_count`: (Integer, optional) - The number of blood storage centers associated with the facility (required if `blood_storage_centers` is "Y").

- `blood_collected_per_annum`: (String, optional) - The number of blood units collected by the facility per annum.

- `blood_required_per_annum`: (String, optional) - The amount of blood required by the facility per annum.

- `imaging_services`: (Array of Hashes, optional) - A list of imaging services offered by the facility. Each entry includes:
  - `service`: (String, required) - The code of the imaging service provided. Accepted codes are specified in the `get-master-data API` with `type='IMAGING'`.
  - `count`: (Integer, required) - The number of equipment for the given imaging service.

- `diagnostic_services`: (Array of Strings, optional) - A list of diagnostic services provided by the facility (applicable if the facility type is a diagnostic lab). Accepted codes are specified in the `get-master-data API` with `type='DIAGNOSTIC'`.


## Request Body
```ruby
@client.detailed_information(
  specialities_list: [
    {
      systemOfMedicineCode: "M",
      isSpecializationAvailable: "Y",
      specialities: ["s6", "s13"]
    }
  ],
  count_hdu_beds_with_functional_ventilators: 10,
  count_ipd_beds_without_oxygen: 20,
  count_ipd_beds_with_oxygen: 15,
  count_icu_beds_with_ventilators: 8,
  count_icu_beds_without_ventilators: 2,
  count_hdu_beds_with_ventilators: 5,
  count_hdu_beds_without_ventilators: 7,
  total_number_of_ventilators: 20,
  count_day_care_beds_without_oxygen: 5,
  count_day_care_beds_with_oxygen: 10,
  count_dental_chairs: 3,
  total_number_of_beds: 75,
  is_jan_aushadhi_kendra: "Y",
  jan_aushadhi_kendra_id: "JAK123",
  drug_license_number: "DL123456",
  pharmacy_gstin_number: "GSTIN123456",
  pharmacist_registration_number: "PRN123456",
  is_facility_registered_in_e_raktkosh: "Y",
  e_raktosh_id: "ER123456",
  blood_bank_license_number: "BBLN123456",
  blood_storage_centers: "Y",
  storage_centers_count: 2,
  blood_collected_per_annum: "3000",
  blood_required_per_annum: "3500",
  imaging_services: [
    {
      service: "MRI",
      count: 3
    }
  ],
  diagnostic_services: [
    {
      service: "Blood Test",
      count: 10
    }
  ]
)
```

## Response Body
```json
{
  "tracking_id": "73478",
  "status": "Saved",
  "message": "Facility details have been saved successfully. Please login at https://facility.abdm.gov.in and submit your facility details for approval.",
  "error_status": null
}
```


After completing the Detailed Information API step, you are now ready to finalize your facility’s registration. The next task is to log in to the Health Facility Registry portal and submit your facility’s details for approval. This step will ensure that all provided data is reviewed and validated for inclusion in the registry.
