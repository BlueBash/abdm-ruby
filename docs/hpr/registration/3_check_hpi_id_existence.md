# HPR Registration - Check HPID Existence by Aadhaar

This API allows you to check if an HPID (Healthcare Professional ID) already exists for a given Aadhaar number after verifying the Aadhaar OTP in **Step 2**. The API will return the HPID if it exists.


## Parameters

- No parameters are required for this API call.


## Method
```ruby
check_hpi_existence()
```

## Request Body

To check if an HPID exists:

```ruby
@client.check_hpi_existence
```

## Response Body
```json
{
  "token": "",
  "hprIdNumber": "71-****-*****-***8",
  "categoryId": 0,
  "subCategoryId": 0,
  "new": false
}
```

If the HPID exists, it will be returned, and you can proceed to the next steps in the HPR registration flow. If no HPID exists, you will need to register a new one.
