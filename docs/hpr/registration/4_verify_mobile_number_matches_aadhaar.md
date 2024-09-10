# HPR Registration - Verify Mobile Number Matches Aadhaar

This API allows you to verify if the provided mobile number matches the one registered with Aadhaar after the OTP verification step.

## Parameters

- `mobileNumber`: (String, required) - The mobile number to be verified against the Aadhaar registered mobile number.


## Method
```ruby
verify_mobile_number_matches_aadhaar(
  mobile_number:
)
```

## Request Body

```ruby
@client.verify_mobile_number_matches_aadhaar(
  mobile_number: '1233211231'
)
```

## Response Body

```json
{
  "verified": true
}
```

If the mobile number is verified as correct, you can proceed with the next step in the HPR registration process.
