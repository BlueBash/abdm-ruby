# Courses API

The Courses API is used to fetch a list of courses available in the HPR (Health Professional Registry). You can filter the courses based on parameters provided in the payload.


## Parameters

- `system_of_medicine` (Integer, optional) - The system of medicine for the course. Possible values include:
  - `1`: Modern Medicine
  - `2`: Dentistry
  - `3`: Homoeopathy
  - `4`: Ayurveda
  - `5`: Unani
  - `6`: Siddha
  - `7`: Sowa-Rigpa

- `hpr_type` (String, optional) - The type of professional. Can be:
  - `doctor`
  - `nurse`

- `course_name` (String, optional) - The name of the course.


## Method
```ruby
fetch_courses(
  system_of_medicine:,
  hpr_type:,
  course_name:
)
```


## Request Body 1

To fetch courses with specific filters:

```ruby
@client.fetch_courses(
  system_of_medicine: 1,
  hpr_type: "doctor",
  course_name: "mbbs"
)
```


## Response Body
```json
{
  "coursesList": [
    {
      "identifier": 9573,
      "name": "Mbbs",
      "systemOfMedicine": 1,
      "hprType": "doctor"
    },
    {
      "identifier": 9574,
      "name": "Mbbs",
      "systemOfMedicine": 1,
      "hprType": "doctor"
    },
    {
      "identifier": 9575,
      "name": "Mbbs",
      "systemOfMedicine": 1,
      "hprType": "doctor"
    },
    {
      "identifier": 9579,
      "name": "Mbbs",
      "systemOfMedicine": 1,
      "hprType": "doctor"
    },
    {
      "identifier": 9580,
      "name": "Mbbs",
      "systemOfMedicine": 1,
      "hprType": "doctor"
    },
    {
      "identifier": 4060,
      "name": "MBBS - Bachelor of Medicine and Bachelor of Surgery",
      "systemOfMedicine": 1,
      "hprType": "doctor"
    }
  ],
  "Message": null
}
```


## Request Body 2
To fetch a list of all courses:

```ruby
@client.fetch_courses
```


## Response Body
```json
{
  "coursesList": [
    {
      "identifier": 9686,
      "name": "",
      "systemOfMedicine": 4,
      "hprType": "doctor"
    },
    {
      "identifier": 5517,
      "name": "10th",
      "systemOfMedicine": 0,
      "hprType": "nurse"
    },
    {
      "identifier": 4602,
      "name": "10th",
      "systemOfMedicine": 1,
      "hprType": "doctor"
    },
    {
      "identifier": 5518,
      "name": "12th",
      "systemOfMedicine": 0,
      "hprType": "nurse"
    },
    {
      "identifier": 4603,
      "name": "12th",
      "systemOfMedicine": 1,
      "hprType": "doctor"
    },
    {
      "identifier": 9728,
      "name": "A",
      "systemOfMedicine": 2,
      "hprType": "doctor"
    },
    {
      "identifier": 9564,
      "name": "Yihj",
      "systemOfMedicine": 7,
      "hprType": "doctor"
    }
  ],
  "Message": null
}
```

## Notes

- If you do not provide any parameters, the API will return a list of all available courses.

- The `system_of_medicine` field indicates the system of medicine for the course.

- The `hpr_type` field specifies whether the course is for doctors or nurses.

- The `course_name` field allows for searching courses by name.
