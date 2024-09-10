# Search For Facility API

This API provides a list of facilities present in the Health Facility Registry (HFR) system based on search criteria. It returns basic details such as Facility ID, Name, and demographic information.

## Important Notes:
- You can search using either a specific Facility ID or other search criteria.
- If you use a Facility ID, other search parameters are ignored.
- Without a Facility ID, all required parameters must be provided.
- Data must be in the specified format for each field.
- Certain demographic details need LGD Codes (Local Government Directory). Visit [LG Directory](https://lgdirectory.gov.in/) for more details.
- The API performs a fuzzy match on facility names and an exact match on other attributes.
- Results are paginated. By default, the first page with 10 records is returned, unless specified otherwise.
- Use this API to find registered facilities and avoid creating duplicates through other APIs.

## Parameters:

- `ownership_code`: (String, required if `facilityId` is not present) - Ownership of the facility to be searched. Accepted codes are specified in the `getmaster-data` API with type=`OWNER`.

- `state_lgd_code`: (String, required if `facilityId` is not present) - State of the facility. The value should be from LGD.

- `district_lgd_code`: (String, optional) - District of the facility. The value should be from LGD.

- `subdistrict_lgd_code`: (String, optional) - Sub-district of the facility. The value should be from LGD.

- `pincode`: (String, optional) - Pin code of the facility. Must be a valid 6-digit number.

- `facilityName`: (String, required if `facilityId` is not present) - Name of the facility being searched. Can be a full or partial name.

- `facility_id`: (String, optional) - 12-character Facility ID allotted to each facility at the time of submission. If present, only details for this facility are returned.

- `page`: (Integer, optional) - Page number of results to be retrieved. Default is 1.

- `results_per_page`: (Integer, optional) - Number of facilities to return per page. Default is 10.


### Method
```ruby
search_facility(
  ownership_code:,
  state_lgd_code:,
  district_lgd_code:,
  subdistrict_lgd_code: ,
  pincode:,
  facility_name:,
  facility_id:,
  page:,
  results_per_page:
)
```


## Request Body:

```ruby
@client.search_facility(
  ownership_code: 'P',
  state_lgd_code: '3',
  pincode: '160059',
  facility_name: 'Orthopedics Center',
  page: 1,
  results_per_page: 2
)
```

## Response Body:
```json
{
    "facilities": [
        {
            "facilityId": "IN0310000334",
            "facilityName": "Orthopedics Center",
            "facilityStatus": "Submitted",
            "ownership": "Private",
            "ownershipCode": "P",
            "systemOfMedicineCode": "M",
            "systemOfMedicine": "Modern Medicine(Allopathy)",
            "facilityTypeCode": "5",
            "facilityType": "Hospital",
            "stateName": "PUNJAB",
            "stateLGDCode": "3",
            "districtName": "S.A.S Nagar",
            "districtLGDCode": "608",
            "subDistrictName": "SAS Nagar (Mohali)",
            "subDistrictLGDCode": "267",
            "villageCityTownName": null,
            "villageCityTownLGDCode": "39232",
            "address": "Bluemed Clinic, ",
            "pincode": "160059",
            "latitude": "30.704649",
            "longitude": "76.717873"
        }
    ],
    "message": "Request processed successfully",
    "totalFacilities": 1,
    "numberOfPages": 1
}
```