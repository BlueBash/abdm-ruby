# Nurse Affiliated Boards API

The Nurse Affiliated Boards API fetches a list of affiliated boards or universities. You can filter the results based on parameters provided in the payload.


## Parameters

- `identifier` (Integer, optional) - The unique identifier of the affiliated board or university to filter by.


## Method
```ruby
fetch_nurse_affiliated_boards(
  identifier:
)
```


## Request Body 1
To fetch nurse affiliated boards with a specific identifier:

```ruby
@client.fetch_nurse_affiliated_boards(identifier: 1)
```


#### Response
```json
{
    "nurseAffiliatedBoard": [
        {
            "identifier": 1,
            "name": "Central Board Of Secondary Education (CBSE)",
            "state": null
        }
    ],
    "Message": null
}
```


## Request Body 2

To fetch a list of all nurse affiliated boards:

```ruby
@client.fetch_nurse_affiliated_boards
```


## Response Body

```json
{
    "nurseAffiliatedBoard": [
        {
            "identifier": 280,
            "name": "ABC BOARD",
            "state": "Sikkim"
        },
        {
            "identifier": 358,
            "name": "Acharaya N.G.Ranga Agricultural University",
            "state": "Telangana"
        },
        {
            "identifier": 281,
            "name": "Acharaya Nagarjuna University",
            "state": "Sikkim"
        },
        {
            "identifier": 462,
            "name": "ALIAH UNIVERSITY",
            "state": "West bengal"
        },
        {
            "identifier": 398,
            "name": "ALIGARH MUSLIM UNIVERSITY",
            "state": "Uttarakhand"
        },
        {
            "identifier": 208,
            "name": "YMCA University of Science & Technology",
            "state": "Punjab"
        }
    ],
    "Message": null
}
```

## Notes

- The `identifier` field can be used to filter the affiliated boards by their unique identifier.
- If no parameters are provided, the API will return a list of all available nurse affiliated boards.
