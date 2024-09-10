# HPR Registration - Verify Aadhaar OTP

Once you receive the OTP generated in **Step 1**, you can verify it using this API. The OTP will validate the Aadhaar number provided and return user information if successful.

## Parameters

- `otp_value` (String, required) - The OTP sent to the Aadhaar-registered mobile number.


## Method
```ruby
verify_aadhaar_otp(
  otp_value:
)
```

## Request Body

To verify the Aadhaar OTP for a specific transaction:

```ruby
@client.verify_aadhaar_otp(
  otp_value: '123456'
)
```

## Response Body
```json
{
  "txnId": "123456xx-74xx-43xx-91xx-123456exxxxx",
  "mobileNumber": null,
  "photo": "dummy_photo_data_here",
  "gender": "M",
  "name": "John Doe",
  "email": null,
  "pincode": "123456",
  "birthdate": "01-01-1990",
  "careOf": "Jane Doe",
  "house": "1234 Example Street",
  "street": null,
  "landmark": "Near Park",
  "locality": null,
  "villageTownCity": "Sampletown",
  "subDist": null,
  "district": "Sample District",
  "state": "Sample State",
  "postOffice": "Sample Post Office",
  "address": "C/O Jane Doe 1234 Example Street Near Park Sampletown"
}
```

Once the Aadhaar OTP is verified, proceed to the next step in the HPR registration process.
