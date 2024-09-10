# HPR Registration - Create HPRID

This API is used to generate the HPRID (Health Professional ID). The user needs to provide personal details, along with an encrypted email and password. The response will include the HPRID and access token.

## Parameters

- `email`: (String, required) - Encrypted email of the user.
- `first_name`: (String, required) - User's first name.
- `middle_name`: (String, optional) - User's middle name (if any).
- `last_name`: (String, required) - User's last name.
- `password`: (String, required) - Encrypted password of the user.
- `profile_photo`: (String, optional) - Base64 encoded photo of the user.
- `state_code`: (String, required) - User's state code.
- `dist_code`: (String, required) - User's district code.
- `pin_code`: (String, required) - User's pincode.
- `hpr_id`: (String, required) - Desired HPR ID for the user.
- `hp_category_code`: (Integer, required) - Health professional category code.
- `hp_subcategory_code`: (Integer, required) - Health professional subcategory code.
- `notify_user`: (Boolean, optional) - Whether to notify the user via email/SMS.


## Method
```ruby
create_hprid(
  email:,
  first_name:,
  middle_name: nil,
  last_name:,
  password:,
  profile_photo:,
  state_code:,
  dist_code:,
  pin_code:,
  hpr_id:,
  hp_category_code:,
  hp_subcategory_code:,
  notify_user: true:
)
```


## Request Body

```ruby
@client.create_hprid(
  email: 'email@gmail.com',
  first_name: 'John',
  middle_name: 'Doe',
  last_name: 'Smith',
  password: 'password123',
  profile_photo: '<BASE64 STRING>',
  state_code: '07',
  dist_code: '71',
  pin_code: '110001',
  hpr_id: 'johnsmith@hpr.abdm',
  hp_category_code: 1,
  hp_subcategory_code: 1,
  notify_user: true
)
```


## Response Body

```json
{
    "token": "",
    "expiresIn": 1800,
    "refreshToken": "",
    "refreshExpiresIn": 10800,
    "hprIdNumber": "12-3456-7890-1234",
    "name": "John Smith",
    "gender": "M",
    "yearOfBirth": "1990",
    "monthOfBirth": "01",
    "dayOfBirth": "01",
    "firstName": "John",
    "hprId": "johnsmith@hpr.abdm",
    "lastName": "Smith",
    "middleName": "Doe",
    "stateCode": "07",
    "districtCode": "71",
    "stateName": "Delhi",
    "districtName": "South Delhi",
    "email": null,
    "mobile": "9012345678",
    "categoryId": 1,
    "subCategoryId": 1,
    "authMethods": [
        "AADHAAR_OTP",
        "DEMOGRAPHICS",
        "AADHAAR_BIO",
        "PASSWORD",
        "MOBILE_OTP"
    ],
    "new": true,
    "categories": {}
}
```

Once the HPR ID is created, the user can authenticate and access other features provided by the HPRID platform.
