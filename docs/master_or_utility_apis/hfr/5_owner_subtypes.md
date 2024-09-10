# Get Owner Subtypes API

The `Get Owner Subtypes API` allows you to retrieve a list of ownership subtypes and further subtypes, based on the `ownership_code` provided. If a valid `owner_subtype_code` is passed, you will get the next level of subtypes.


## Notes
- `ownership_code` is a mandatory parameter.
- You can optionally provide `owner_subtype_code` to retrieve a list of subtypes under a specific ownership type.


## Parameters

1. `ownership_code`: (String, required) - The ownership classification of the facility. Accepted codes can be retrieved using the `Master Data API` with `type=OWNER`.

2. `owner_subtype_code`: (String, optional) - The ownership subtype code under a specific ownership. Use the `Get Owner Subtypes API` to retrieve valid subtype codes.


## Method
```ruby
fetch_owner_subtypes(
  ownership_code:,
  owner_subtype_code:
)
```


## Request Body
```ruby
@client.fetch_owner_subtypes(
  ownership_code: 'P',
  owner_subtype_code: ''
)
```


## Response Body
```json
{
  "type": "OWNER-SUBTYPE",
  "data": [
    {
      "code": "P",
      "value": "Profit"
    },
    {
      "code": "NP",
      "value": "Not for Profit"
    }
  ]
}
```

