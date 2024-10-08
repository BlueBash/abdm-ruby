# ABHA Creation via Aadhaar

This guide explains how to create an Ayushman Bharat Health Account (ABHA) using Aadhaar through the `ABDM-ruby` gem.



## Pre-requisites

Before you begin the ABHA creation process, ensure that:

1. You have installed and configured the `ABDM-ruby` gem. (Refer to the [Installation Guide](docs/1_installation.md) for details).
2. You have a valid Aadhaar number and a mobile number linked to your Aadhaar.
3. You are familiar with how the gem handles [Responses and Exceptions](docs/3_response_and_exception_handling.md), to effectively manage API responses and errors.



## ABHA Creation Steps

Creating an ABHA via Aadhaar requires a series of API calls. The `@client` object manages the flow by storing essential response values like `txnId`, `session_token`, and others, which are reused in subsequent API calls.


### Initialize the Client

Start by creating an instance of the `ABDM::Abha` class:

#### Method
```ruby
@client = ABDM::Abha.new
```



### 1. Generate Aadhaar OTP

The first step is to generate an OTP for Aadhaar verification.

#### Parameters
- `aadhaar_number`: String - The Aadhaar number for which the OTP will be generated.

#### Method
```ruby
generate_aadhaar_otp(aadhaar_number: )
```

#### Request Body
```ruby
@client.generate_aadhaar_otp(aadhaar_number: '123456789012')
```

#### Response Body
```json
{
  "txnId": "bace3e1e-b09e-4506-b80d-d98fd16f1acb",
  "message": "OTP sent to Aadhaar registered mobile number ending with ******0704"
}
```

> The `txnId` from the response is automatically stored in `@client.transaction_id` and will be used in subsequent API calls.




### 2. Resend Aadhaar OTP

If the OTP was not received or has expired, you can resend the OTP using the same method as in Step 1.

#### Parameters
- `aadhaar_number`: String - The Aadhaar number for which the OTP will be regenerated.

#### Method
```ruby
resend_aadhaar_otp(aadhaar_number: )
```

#### Request Body
```ruby
@client.resend_aadhaar_otp(aadhaar_number: '123456789012')
```

#### Response Body
```json
{
  "txnId": "bace3e1e-b09e-4506-b80d-d98fd16f1acb",
  "message": "OTP resent to Aadhaar registered mobile number ending with ******0704"
}
```



### 3. Enrol ABHA

After successfully verifying the Aadhaar OTP, the next step is to enrol and create the ABHA ID from the previous steps.

#### Parameters
- `otp_value`: String *(required)* - The OTP value received on your Aadhaar-registered mobile number.
- `mobile_number`: String *(required)* - The primary mobile number to be used for ABHA enrolment, which may be different from the Aadhaar-linked mobile number.

#### Method
```ruby
enrol_abha(
  otp_value:,
  mobile_number:
)
```

#### Request Body
```ruby
@client.enrol_abha(otp_value: '123456', mobile_number: '9876543210')
```

#### Response Body
```json
{
  "message": "Account created successfully",
  "txnId": "bace3e1e-b09e-4506-b80d-d98fd16f1acb"
}
```



### 4. ABHA Mobile Verification

After enrolling an ABHA, you need to verify the mobile number provided during enrolment. If the mobile number is different from the Aadhaar-linked mobile number, you must send an OTP for verification.

#### Note:
- If the primary mobile number matches the Aadhaar-linked mobile number, it is saved in the database.
- If the primary mobile number is different from the Aadhaar-linked mobile number, it is not saved, and its value is set to `null`.

#### Parameters
- `mobile_number`: String (required) - The mobile number that was provided during the ABHA enrolment. This is used to send a verification OTP.

#### Method
```ruby
send_mobile_otp(mobile_number: )
```

#### Request Body
```ruby
@client.send_mobile_otp(mobile_number: '9876543210')
```

#### Response Body
```json
{
  "txnId": "bace3e1e-b09e-4506-b80d-d98fd16f1acb",
  "message": "OTP sent to the mobile number ending with ******3210"
}
```



### 5. Verify Mobile OTP

After receiving the OTP on the mobile number, you need to verify it to complete the mobile number verification process.

#### Parameters
- `otp_value`: String (required) - The OTP received on the mobile number.

#### Method
```ruby
verify_mobile_otp(otp_value: )
```

#### Request Body
```ruby
@client.verify_mobile_otp(otp_value: '123456')
```

#### Response Body
```json
{
  "txnId": "bace3e1e-b09e-4506-b80d-d98fd16f1acb",
  "authResult": "success",
  "message": "OTP verified successfully"
}
```



### 6. Send Email Verification Link

After completing the ABHA enrolment and mobile verification, you need to verify the email address.

#### Parameters
- `email_id`: String (required) - The email address for which the verification link will be sent. This should be RSA encrypted.

#### Method
```ruby
send_email_verification_link(email_id:)
```

#### Request Body
```ruby
@client.send_email_verification_link(email_id: 'example@example.com')
```

#### Response Body
No response body is provided. check with this
```ruby
@client.response_code
```



### 7. Get ABHA Address Suggestion

This API call retrieves suggestions for ABHA addresses based on the current transaction. It helps users find available ABHA addresses.

#### Parameters
- No parameters are required for this method.

#### Method
```ruby
get_abha_address_suggestion()
```

#### Request Body
```ruby
@client.get_abha_address_suggestion
```

#### Response Body
```json
{
  "txnId": "bace3e1e-b09e-4506-b80d-d98fd16f1acb",
  "abhaAddressList": [
    "bikash1",
    "bikash1997",
    "bikash.choudhury",
    "bikash228",
    "choudhury228"
  ]
}
```



### 8. Create Custom ABHA Address

This API call is used to create a custom ABHA address for the user. You need to provide the desired custom ABHA address.

#### Parameters
- `abha_address`: String (required) - The custom ABHA address that the user wants to create.
- `preferred`: Integer (optional) - Indicates if the custom ABHA address should be set as the preferred address. Accepted value is `1`.

#### Method
```ruby
create_custom_abha_address(
  abha_address:,
  preferred:
)
```

#### Request Body
```ruby
@client.create_custom_abha_address(
  abha_address: 'bikash22',
  preferred: 1
)
```

#### Response Body
```json
{
  "txnId": "bace3e1e-b09e-4506-b80d-d98fd16f1acb",
  "healthIdNumber": "91-6285-4575-XXXX",
  "preferredAbhaAddress": "bikash22"
}
```



## Conclusion

This guide provides a overview of the ABHA creation process via Aadhaar using the `ABDM-ruby` gem. By following these steps, you can successfully create and manage an Ayushman Bharat Health Account, including generating OTPs, verifying mobile numbers and emails, and setting up custom ABHA addresses.

For those interested in creating an ABHA via Driving License, please refer to the [ABHA Creation via Driving License Guide](docs/abha/2_creation_via_dsssriving_license.md).
