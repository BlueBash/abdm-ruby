# HPR Registration - Step 2: Verify Mobile OTP

This API verifies the OTP generated for a mobile number during the registration process. It requires the OTP received on the mobile number and the transaction ID from the previous OTP generation step.

## Parameters

- `otp_value`: (String, required) - The OTP received on the mobile number.

## Method
```ruby
verify_mobile_otp(
  otp_value:
)
```

## Request Body

```ruby
@client.verify_mobile_otp(otp_value: 123123)
```

## Response Body

```json
{
    "txnId": "37ccfe4f-6703-4666-a6eb-25eb58909b5f",
    "mobileNumber": null
}
```

Once the OTP is verified, you can proceed to complete the HPR registration process.
