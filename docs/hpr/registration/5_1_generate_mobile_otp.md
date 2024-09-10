# HPR Registration - step 1: Generate Mobile OTP

This API is used to generate an OTP for mobile number verification if the demographic authentication with Aadhaar has failed. It requires the mobile number and the transaction ID from the previous OTP generation step.


## Parameters

- `mobile`: (String, required) - The mobile number for which the OTP is to be generated.


## Method
```ruby
generate_mobile_otp(mobile_number:)
```


## Request Body

```ruby
@client.generate_mobile_otp(mobile_number: '1233211231')
```


## Response Body

```json
{
    "txnId": "37ccfe4f-6703-4666-a6eb-25eb58909b5f",
    "mobileNumber": null
}
```


After receiving the OTP, you can proceed to the mobile OTP verification step in the HPR registration flow.
