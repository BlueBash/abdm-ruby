# System of Medicine API

The `System of Medicine API` retrieves a list of systems of medicine used in the Health Facility Registry (HFR) system. This list helps categorize and standardize the medical practices followed in various health facilities.


## Notes

1. This API does not require any parameters.

2. The response includes a list of `systemofMedicineList`.


## Method
```ruby
fetch_system_of_medicine()
```


## Request Body

```ruby
@client.fetch_system_of_medicine
```


## Response Body

```json
{
    "systemofMedicineList": [
        {
            "identifier": 4,
            "name": "Ayurveda",
            "code": "ayurveda"
        },
        {
            "identifier": 2,
            "name": "Dentistry",
            "code": "dentist"
        },
        {
            "identifier": 3,
            "name": "Homoeopathy",
            "code": "homeopathy"
        },
        {
            "identifier": 1,
            "name": "Modern Medicine",
            "code": "modern_medicine"
        },
        {
            "identifier": 13,
            "name": "Pharmacy",
            "code": "pharma"
        },
        {
            "identifier": 8,
            "name": "Registered Auxiliary Nurse Midwife(RANM)",
            "code": "ranm"
        },
        {
            "identifier": 11,
            "name": "Registered Lady Health Visitor  (RLHV)",
            "code": "rlhv"
        },
        {
            "identifier": 9,
            "name": "registered nurse (RN)",
            "code": "rn"
        },
        {
            "identifier": 10,
            "name": "Registered Nurse and Registered Midwife (RN & RM)",
            "code": "rnrm"
        },
        {
            "identifier": 12,
            "name": "Registered Pharmacist",
            "code": "rp"
        },
        {
            "identifier": 6,
            "name": "Siddha",
            "code": "siddha"
        },
        {
            "identifier": 7,
            "name": "Sowa-Rigpa",
            "code": "sowa_rigpa"
        },
        {
            "identifier": 5,
            "name": "Unani",
            "code": "unani"
        }
    ],
    "Message": null
}
```
