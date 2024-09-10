# States API

The States API fetches a list of all states. You can filter the states based on parameters provided in the payload.


## Parameters

- `state_name` (String, optional) - The name of the state to filter by.

## Method
```ruby
fetch_states(state_name: )
```


## Request Body 1

To fetch states with a specific name filter:

```ruby
@client.fetch_states(state_name: "Andhra Pradesh")
```


## Response Body

```json
{
    "statesList": [
        {
            "identifier": 2,
            "name": "ANDHRA PRADESH",
            "stateISO": "28",
            "country": "India"
        }
    ],
    "Message": null
}
```


## Request Body 2

To fetch a list of all states:

```ruby
@client.fetch_states
```


## Response Body

```json
{
    "statesList": [
        {
            "identifier": 1,
            "name": "ANDAMAN AND NICOBAR ISLANDS",
            "stateISO": "35",
            "country": "India"
        },
        {
            "identifier": 2,
            "name": "ANDHRA PRADESH",
            "stateISO": "28",
            "country": "India"
        },
        {
            "identifier": 3,
            "name": "ARUNACHAL PRADESH",
            "stateISO": "12",
            "country": "India"
        },
        {
            "identifier": 4,
            "name": "ASSAM",
            "stateISO": "18",
            "country": "India"
        },
        {
            "identifier": 5,
            "name": "BIHAR",
            "stateISO": "10",
            "country": "India"
        },
        {
            "identifier": 6,
            "name": "CHANDIGARH",
            "stateISO": "4",
            "country": "India"
        },
        {
            "identifier": 36,
            "name": "WEST BENGAL",
            "stateISO": "19",
            "country": "India"
        }
    ],
    "Message": null
}
```

## Notes

- The `state_name` field can be used to filter the states by their name.
- If no parameters are provided, the API will return a list of all available states.
