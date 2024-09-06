# ABHA Creation via Driving License

This guide explains how to create an Ayushman Bharat Health Account (ABHA) using a Driving License through the `ABDM-ruby` gem.

## Pre-requisites

Before you begin the ABHA creation process via Driving License, ensure that:

1. You have installed and configured the `ABDM-ruby` gem. (Refer to the [Installation Guide](#installation) for details).
2. You have a valid Driving License and a mobile number for verification.

## ABHA Creation Steps

The process of creating an ABHA via Driving License involves multiple API calls. The `@client` object manages the flow by storing important response values like `txnId` and others, which are reused in subsequent API calls.

### Initialize the Client

Start by creating an instance of the `ABDM::Abha` class:

```ruby
@client = ABDM::Abha.new
```


### 1. Generate Driving License OTP

The first step is to generate an OTP for mobile verification via Driving License.

#### Parameters:
- `mobile_number`: String (required) - The mobile number to which the OTP will be sent.

#### Example:
```ruby
@client.generate_dl_otp(mobile_number: '9876543210')
```

#### Example Response:
```json
{
  "txnId": "bace3e1e-b09e-4506-b80d-d98fd16f1acb",
  "message": "OTP sent to the mobile number ending with ******3210"
}
```

The `txnId` from the response is automatically stored in `@client.transaction_id` and will be used in subsequent API calls.

---

### 2. Verify Driving License OTP

After receiving the OTP, you need to verify it to proceed with the Driving License verification.

#### Parameters:
- `otp_value`: String (required) - The OTP received on the mobile number.

#### Example:
```ruby
@client.verify_dl_otp(otp_value: '123456')
```

#### Example Response:
```json
{
  "message": "OTP verification successful."
}
```

---

### 3. Submit Driving License Details

Once the OTP is verified, submit the Driving License details to proceed with the ABHA creation.

#### Parameters:
- `document_id`: String (required) - The Driving License number.
- `first_name`: String (required) - The user's first name.
- `last_name`: String (required) - The user's last name.
- `date_of_birth`: String (required) - The user's date of birth in this format yyyy-mm-dd.
- `gender`: String (required) - The user's gender, Example: M/F/O.
- `encoded_front_side_photo`: String (required) - Base64 encoded front side of the Driving License.
- `encoded_back_side_photo`: String (required) - Base64 encoded back side of the Driving License.
- `address`: String (required) - The user's address.
- `state`: String (required) - The user's state.
- `district`: String (required) - The user's district.
- `pin_code`: String (required) - The user's pin code.

#### Example:
```ruby
@client.verify_dl_document(
  document_id: 'DL1234567890',
  first_name: 'John',
  last_name: 'Doe',
  date_of_birth: '1996-7-15',
  gender: 'M',
  encoded_front_side_photo: 'base64string',
  encoded_back_side_photo: 'base64string',
  address: '123 Main Street',
  state: 'Delhi',
  district: 'New Delhi',
  pin_code: '110001'
)
```

#### Example Response:
```json
{
  "EnrolProfile": {
    "enrolmentNumber": "91-6087-5423-XXXX",
    "enrolmentState": "VERIFIED",
    "firstName": "John",
    "middleName": "",
    "lastName": "Doe",
    "dob": "1996-7-15",
    "gender": "M",
    "mobile": "******7415",
    "email": null,
    "address": "123 Main Street",
    "districtCode": "11",
    "district": "New Delhi",
    "stateCode": "07",
    "state": "Delhi",
    "abhaType": "STANDARD",
    "pinCode": 110001,
    "abhaStatus": "ACTIVE",
    "phrAddress": ["91612124231330@abdm"]
  }
}
```


## Conclusion

This guide walks you through the process of creating an ABHA via Driving License using the `ABDM-ruby` gem. Ensure that all provided details, including the encoded documents, are accurate for successful verification.
