# Facility Type API

The `Facility Type API` allows you to fetch the master data set for facility types, filtered by ownership and system of medicine. This data is critical for registering a healthcare facility in the HFR system.

## Notes

1. You must provide the required parameters such as `ownership_code` to retrieve relevant facility types.

2. Optionally, you can filter facility types based on the system of medicine using `system_of_medicine_code`. If there are multiple systems of medicine, send a comma-separated string of codes.

## Parameters

- `ownership_code`: (String, required) - The ownership classification of the facility. Accepted codes can be retrieved using the `Master Data API` with `type=OWNER`.
- `system_of_medicine_code`: (String, optional) - The system of medicine followed by the facility. Accepted codes can be found using the `Master Data API` with `type=MEDICINE`. If the facility practices multiple systems, pass a comma-separated string of codes.


## Method
```ruby
fetch_facility_type(
  ownership_code:,
  system_of_medicine_code:
)
```


## Request Body
```ruby
@client.fetch_facility_type(
  ownership_code: 'G',
  system_of_medicine_code: 'D'
)
```

## Response Body
```json
{
    "type": "FACILITY-TYPE",
    "data": [
        {
            "code": "2",
            "value": "Primary Health Centre"
        },
        {
            "code": "1",
            "value": "Sub Centre"
        },
        {
            "code": "11",
            "value": "Pharmacy"
        },
        {
            "code": "7",
            "value": "Dental College"
        },
        {
            "code": "8",
            "value": "Dental Hospital"
        },
        {
            "code": "16",
            "value": "Dental Clinic"
        },
        {
            "code": "102",
            "value": "Health and Wellness Centre"
        },
        {
            "code": "38",
            "value": "Other Facility"
        }
    ]
}
```

After fetching the relevant facility types, use these codes in the subsequent API requests for facility registration or updates.

