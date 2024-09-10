# Districts API

The Districts API fetches a list of all districts. You can filter the districts based on parameters provided in the payload.


## Parameters

- `state_name` (String, optional) - The name of the state to filter districts by.


## Method
```ruby
fetch_districts(state_name: )
```

## Request Body 1

To fetch districts in a specific state:

```ruby
@client.fetch_districts(state_name: 'LAKSHADWEEP')
```


## Response Body
```json
{
    "districtsList": [
        {
            "identifier": 312,
            "name": "LAKSHADWEEP DISTRICT",
            "districtISO": "553",
            "state": "LAKSHADWEEP"
        }
    ],
    "Message": null
}
```

## Request Body 2

To fetch a list of all districts:

```ruby
@client.fetch_districts
```


## Response Body

```json
{
    "districtsList": [
        {
            "identifier": 712,
            "name": "24 PARAGANAS NORTH",
            "districtISO": "303",
            "state": "WEST BENGAL"
        },
        {
            "identifier": 713,
            "name": "24 PARAGANAS SOUTH",
            "districtISO": "304",
            "state": "WEST BENGAL"
        },
        {
            "identifier": 580,
            "name": "ADILABAD",
            "districtISO": "501",
            "state": "TELANGANA"
        },
        {
            "identifier": 313,
            "name": "AGAR MALWA",
            "districtISO": "667",
            "state": "MADHYA PRADESH"
        },
        {
            "identifier": 637,
            "name": "AGRA",
            "districtISO": "118",
            "state": "UTTAR PRADESH"
        },
        {
            "identifier": 155,
            "name": "AHMADABAD",
            "districtISO": "438",
            "state": "GUJARAT"
        },
        {
            "identifier": 365,
            "name": "AHMEDNAGAR",
            "districtISO": "466",
            "state": "MAHARASHTRA"
        },
        {
            "identifier": 449,
            "name": "ZUNHEBOTO",
            "districtISO": "251",
            "state": "NAGALAND"
        }
    ],
    "Message": null
}
```

## Notes

- The `state_name` field can be used to filter districts by their state.
- If no parameters are provided, the API will return a list of all available districts.
