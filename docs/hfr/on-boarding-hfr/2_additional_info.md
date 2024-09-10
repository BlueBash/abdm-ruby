# Step 2: Additional Information API

Once the `Basic Facility Information API` is called and the facility is marked as "Functional," the next step is to provide additional information about the facility using this API. The `trackingId` generated in the previous step is used for updating the dataset for the draft facility.


## Method:
```ruby
additional_information(
  tracking_id:,
  has_dialysis_center:,
  has_pharmacy:,
  has_blood_bank:,
  has_cath_lab:,
  has_diagnostic_lab:,
  has_imaging_center:,
  services_by_imaging_center:,
  nhrr_id:,
  nin:,
  abpmjay_id:,
  rohini_id:,
  echs_id:,
  cghs_id:,
  cea_registration:,
  state_insurance_scheme_id:
)
```


## Parameters

- `tracking_id`: (String, required) - If you have followed the steps sequentially from `Step 1: Basic Facility Information API`, the `tracking_id` is already stored in the `@client` instance, so you do not need to pass it again. However, if you're directly using this API or working in another context, you must provide the `tracking_id` manually.

- `has_dialysis_center`: (String, optional) - Specifies whether the facility has a dialysis center. This field applies if the facility is not a Pharmacy, Diagnostic Lab, Imaging Center, or similar types.

- `has_pharmacy`: (String, optional) - Indicates whether the facility has a pharmacy. This applies unless the facility is a Pharmacy.

- `has_blood_bank`: (String, optional) - Specifies whether the facility has a blood bank. This applies to hospitals offering blood banking services.

- `has_cath_lab`: (String, optional) - Indicates whether the facility has a cath lab (catheterization lab) for cardiovascular procedures.

- `has_diagnostic_lab`: (String, optional) - Indicates whether the facility has a diagnostic laboratory for medical tests.

- `has_imaging_center`: (String, optional) - Specifies if the facility has an imaging center for X-rays, MRIs, and other diagnostic imaging services.

- `services_by_imaging_center`: (Array of Hashes, required if `has_imaging_center` is "Yes") - Provides details about the imaging services offered, including the service code and the count of equipment available for each service.
  - `service`: (String, required) - The code for the specific imaging service.
  - `count`: (Integer, required) - The number of pieces of equipment for the imaging service.

- `nhrr_id`: (String, optional) - The National Health Resource Repository (NHRR) Unique ID assigned to the facility.

- `nin`: (String, optional) - The National Identification Number (NIN) for the facility, required if registered with a national healthcare database.

- `abpmjay_id`: (String, optional) - The hospital ID as allotted by Ayushman Bharat Pradhan Mantri Jan Arogya Yojana (AB-PMJAY) for empaneled hospitals.

- `rohini_id`: (String, optional) - The Rohini ID for the facility, which is required if the facility is listed in the Rohini registry.

- `echs_id`: (String, optional) - The unique ID for the facility under the Ex-Servicemen Contributory Health Scheme (ECHS).

- `cghs_id`: (String, optional) - The unique ID for the facility under the Central Government Health Scheme (CGHS).

- `cea_registration`: (String, optional) - The Clinical Establishments Act (CEA) Registration Number for the facility.

- `state_insurance_scheme_id`: (String, optional) - The State Insurance Scheme ID, used if the facility is part of a state-level health insurance scheme.


## Request Body

```ruby
@client.additional_information(
  has_dialysis_center: "YALL",
  has_pharmacy: "N",
  has_blood_bank: "N",
  has_cath_lab: "N",
  has_diagnostic_lab: "N",
  has_imaging_center: "Y",
  services_by_imaging_center: [
    { service: 'CT_SCAN', count: 2 }
  ],
  nhrr_id: "NHRR123456",
  nin: "NIN123456",
  abpmjay_id: "ABPMJAY123",
  rohini_id: "ROHINI123456",
  echs_id: "ECHS123456",
  cghs_id: "CGHS123456",
  cea_registration: "CEA123456",
  state_insurance_scheme_id: "SIS123456"
)
```


## Response Body
```json
{
  "trackingId": "73478",
  "status": "Created",
  "message": "Facility details have been saved successfully. Please provide the next set of data in \"/v1.5/facility/detailed-information\" API.",
  "errorStatus": null
}
```


After providing the additional facility details using the Additional Information API, the next step is to complete the detailed facility information submission. This involves using the Detailed Information API to finalize and submit comprehensive data about your facility’s infrastructure and services. This step ensures that the Health Facility Registry has all the necessary information to accurately assess your facility and complete the onboarding process.
