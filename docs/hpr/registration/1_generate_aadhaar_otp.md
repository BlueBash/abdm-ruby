# HPR Registration - Generate Aadhaar OTP

The first step in the HPR registration process is generating an OTP (One-Time Password) for verifying the Aadhaar number. This OTP will be sent to the mobile number linked with the Aadhaar card and will be required in the subsequent steps of the registration process.

## Parameters

- `aadhaar_number` (String, required) - The Aadhaar number for which the OTP needs to be generated.


## Method
```ruby
generate_aadhaar_otp(
  aadhaar_number:
)
```


## Request Body

To generate an OTP for a specific Aadhaar number:

```ruby
@client.generate_aadhaar_otp(
  aadhaar_number: '123443211234'
)
```

## Response Body

```json
{
  "txnId": "38022xxx-7xxx-43ba-91ff-4471a25e9xxx",
  "mobileNumber": "xxxxxxxx79"
}
```


Once the OTP has been generated and sent to the registered mobile number, proceed to **Step 2: Verify Aadhaar OTP** to complete Aadhaar verification.
