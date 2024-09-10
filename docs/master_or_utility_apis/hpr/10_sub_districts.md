# Sub-Districts API

The Sub-Districts API fetches a list of all sub-districts. You can filter the sub-districts based on parameters provided in the payload.


## Parameters

- `state_name` (String, optional) - The name of the state to filter sub-districts by.


## Method
```ruby
fetch_sub_districts(state_name: )
```


## Request Body 1

To fetch sub-districts in a specific state:

```ruby
@client.fetch_sub_districts(state_name: 'LAKSHADWEEP')
```


#### Response

```json
{
    "subDistrictsList": [
        {
            "identifier": 4599,
            "name": "'N' Thingdawl",
            "subDistrictISO": "1899",
            "district": "KOLASIB"
        },
        {
            "identifier": 71,
            "name": "A.Konduru",
            "subDistrictISO": "4998",
            "district": "KRISHNA"
        },
        {
            "identifier": 1,
            "name": "Aali",
            "subDistrictISO": "2925",
            "district": "KENDRAPARA"
        },
        {
            "identifier": 2,
            "name": "Aalo HQ",
            "subDistrictISO": "6087",
            "district": "WEST SIANG"
        },
        {
            "identifier": 3,
            "name": "Abapura",
            "subDistrictISO": "6612",
            "district": "BANSWARA"
        },
        {
            "identifier": 4,
            "name": "Abdasa",
            "subDistrictISO": "3728",
            "district": "KACHCHH"
        },
        {
            "identifier": 6857,
            "name": "Zunheboto Sadar",
            "subDistrictISO": "1772",
            "district": "ZUNHEBOTO"
        }
    ],
    "Message": null
}
```


## request Body 2

To fetch a list of all sub-districts:

```ruby
@client.fetch_sub_districts
```


## Response Body
```json
{
    "subDistrictsList": [
        {
            "identifier": 4599,
            "name": "'N' Thingdawl",
            "subDistrictISO": "1899",
            "district": "KOLASIB"
        },
        {
            "identifier": 71,
            "name": "A.Konduru",
            "subDistrictISO": "4998",
            "district": "KRISHNA"
        },
        {
            "identifier": 1,
            "name": "Aali",
            "subDistrictISO": "2925",
            "district": "KENDRAPARA"
        },
        {
            "identifier": 2,
            "name": "Aalo HQ",
            "subDistrictISO": "6087",
            "district": "WEST SIANG"
        },
        {
            "identifier": 3,
            "name": "Abapura",
            "subDistrictISO": "6612",
            "district": "BANSWARA"
        },
        {
            "identifier": 4,
            "name": "Abdasa",
            "subDistrictISO": "3728",
            "district": "KACHCHH"
        },
        {
            "identifier": 5,
            "name": "Abdullapurmet",
            "subDistrictISO": "6319",
            "district": "RANGA REDDY"
        },
        {
            "identifier": 6857,
            "name": "Zunheboto Sadar",
            "subDistrictISO": "1772",
            "district": "ZUNHEBOTO"
        }
    ],
    "Message": null
}
```

## Notes

- The `state_name` field can be used to filter sub-districts by their state.
- If no parameters are provided, the API will return a list of all available sub-districts.
