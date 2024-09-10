# Fetch Facility Subtype API

The `Fetch Facility Subtype API` retrieves a list of facility subtypes based on a provided Facility Type Code.


## Notes

1. The `facility_type_code` parameter is mandatory and should correspond to a valid facility type code.

2. You must provide the `facility_type_code` to get a list of associated facility subtypes.


## Parameters

- `facility_type_code`: (String, required) - The Facility Type Code for which you want to retrieve the facility subtypes. Accepted codes can be found using the `Fetch Facility Type API`.


## Method
```ruby
fetch_facility_subtype(
  facility_type_code:
)
```


## Request Body:

```ruby
@client.fetch_facility_subtype(facility_type_code: '5')
```


## Response Body

```json
{
    "type": "FACILITY-SUB-TYPE",
    "data": [
        {
            "code": "30",
            "value": "No Applicable Subtype"
        },
        {
            "code": "44",
            "value": "Area Hospital"
        },
        {
            "code": "2",
            "value": "Central Hospital"
        },
        {
            "code": "47",
            "value": "Civil Hospital"
        },
        {
            "code": "32",
            "value": "Daycare Center"
        },
        {
            "code": "6",
            "value": "District Hospital"
        },
        {
            "code": "7",
            "value": "Divisional Hospital"
        },
        {
            "code": "28",
            "value": "General Hospital"
        },
        {
            "code": "33",
            "value": "Infertility Center"
        },
        {
            "code": "48",
            "value": "Leprosy Hospital"
        },
        {
            "code": "36",
            "value": "Maternity Home"
        },
        {
            "code": "12",
            "value": "Municipal Corporation Hospital"
        },
        {
            "code": "13",
            "value": "Nursing Home"
        },
        {
            "code": "34",
            "value": "Palliative Care"
        },
        {
            "code": "14",
            "value": "Police Hospital"
        },
        {
            "code": "16",
            "value": "Referral Hospital"
        },
        {
            "code": "17",
            "value": "Regional Hospital"
        },
        {
            "code": "35",
            "value": "Rehabilitation Center"
        },
        {
            "code": "18",
            "value": "Sanatorium"
        },
        {
            "code": "19",
            "value": "Sub-District Hospital"
        },
        {
            "code": "20",
            "value": "Sub-Divisional Hospital"
        },
        {
            "code": "22",
            "value": "Taluka Hospital"
        },
        {
            "code": "21",
            "value": "Taluk Head Quarters Hospital"
        },
        {
            "code": "31",
            "value": "T.B. Hospital"
        },
        {
            "code": "24",
            "value": "Woman's Hospital"
        },
        {
            "code": "25",
            "value": "Workshop Hospital"
        },
        {
            "code": "43",
            "value": "Zonal Hospital"
        },
        {
            "code": "29",
            "value": "Any Other"
        }
    ]
}
```
