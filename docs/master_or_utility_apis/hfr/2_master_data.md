# Master Data API

The `Master Data API` allows you to retrieve a list of specific master data sets based on the master type provided. These master data sets include facility ownership types, systems of medicine, facility types, and other key datasets that are used throughout the HFR APIs.

## Notes

1.  You must provide the `type` parameter to specify which master data set to retrieve.

2. The response will return a list of values and their corresponding codes.

3. All other HFR APIs will only accept the "code" for any field where master data is defined.


## Parameters

- `type`: (String, required) - The type of master data set you wish to retrieve. Accepted values can be found using the `Master Types API`.


## Method
```ruby
fetch_master_data(type:)
```


## Request Body
```ruby
@client.fetch_master_data(type: 'OWNER')
```


## Response Body

```json
{
  "type": "OWNER",
  "data": [
    {
      "code": "G",
      "value": "Government"
    },
    {
      "code": "P",
      "value": "Private"
    },
    {
      "code": "PP",
      "value": "Public-Private-Partnership"
    }
  ]
}
```

In the above response, the master data set for `OWNER` returns a list of ownership types with their corresponding codes, which you will use in the facility registration process.


Now that you have fetched the master data, you can use these codes in further API calls that require specific data types, such as ownership, systems of medicine, facility types, etc.
