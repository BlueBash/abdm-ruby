# Step 4: Submit Facility Details API

The `Submit Facility Details API` is the final step in the process of on-boarding your facility into the HFR. Once submitted, your facility will move from the "Draft" stage to the "Submitted" stage for verification.


## Method
```ruby
submit_facility(
  tracking_id:,
  source_of_information:,
  source_unique_id:,
  facility_super_user:
)
```


## Parameters

- `tracking_id`: String - If you have followed the steps sequentially from `Step 1: Basic Facility Information API`, the `tracking_id` is already stored in the `@client` instance, so you do not need to pass it again. However, if you're directly using this API or working in another context, you must provide the `tracking_id` manually.

- `hpr_id` (String, required): The Healthcare Professional ID number used for authentication. This should be the unique identifier assigned to the healthcare professional.

- `password` (String, required): The password associated with the Healthcare Professional ID. This should be the correct password for the specified `hpr_id`.

- `source_of_information`: (String, optional) - Indicates the source of information for the facility. Should be a valid data source provided by the HFR team. If left empty, the facility will be considered as a submitted entity.

- `source_unique_id`: (String, optional) - Represents the unique ID of the facility as it exists in HRP or the data source. This is used for matching with the existing data source.

- `facility_super_user`: (String, optional) - Marks the HPID of the facility as a super user. Should be a valid super user value as provided by the HFR team. If left empty, the HPID will be marked as a normal user.


## Request Body

```ruby
@client.submit_facility(
  hpr_id: "test_id@hpr.abdm",
  password: "password@123",
  source_of_information: "Internal System",
  source_unique_id: "FAC123456",
  facility_super_user: "superuser123"
)
```


## Response Body
```json
{
  "facilityId": " IN1810000691",
  "status": "Created",
  "message": "Facility created successfully. Please save the Facility Id returned.",
  "errorStatus": null
}
```


## Conclusion

This guide covers `Step 4: Submit Facility Details API`, the final step in on-boarding your health facility using the `ABDM-ruby` gem. Once you successfully call this API, your facility details will be reviewed for verification. Upon successful submission, you will receive a facility ID, indicating that your facility has been successfully on-boarded and is now in the verification process.