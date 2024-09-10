# Medical Council API

The `Medical Council API` retrieves a list of medical councils registered against any system of medicine. You can use this API to filter and fetch specific councils based on the provided parameters.


## Parameters

- `identifier`: (Integer, optional) - The unique identifier of the medical council. If not provided, the response will include all councils.
- `medical_councils_name`: (String, optional) - The name of the medical council. Use this to filter councils by their name.
- `systemOfMedicine`: (String, optional) - The system of medicine code associated with the medical council. Accepted codes can be retrieved using the `System of Medicine API`.


## Method
```ruby
fetch_medical_councils(
  identifier:,
  medical_councils_name:,
  system_of_medicine:
)
```

## Request Body 1

```ruby
@client.fetch_medical_councils(
    identifier: 61,
    medical_councils_name: "Andhra Pradesh Board for Indian Medicine and Homoeopathy",
    system_of_medicine: "3"
)
```

## Response Body

```json
{
    "medicalCouncilList": [
        {
            "identifier": 61,
            "name": "Andhra Pradesh Board for Indian Medicine and Homoeopathy",
            "systemOfMedicine": 3
        }
    ],
    "Message": null
}
```


## Request Body 2

```ruby
@client.fetch_medical_councils
```

## Response Body:

```json
{
    "medicalCouncilList": [
        {
            "identifier": 61,
            "name": "Andhra Pradesh Board for Indian Medicine and Homoeopathy",
            "systemOfMedicine": 3
        },
        {
            "identifier": 90,
            "name": "Andhra Pradesh Board for Indian Medicine and Homoeopathy",
            "systemOfMedicine": 4
        },
        {
            "identifier": 121,
            "name": "Andhra Pradesh Board for Indian Medicine and Homoeopathy",
            "systemOfMedicine": 5
        },
        {
            "identifier": 153,
            "name": "Andhra Pradesh Board for Indian Medicine and Homoeopathy",
            "systemOfMedicine": 6
        },
        {
            "identifier": 183,
            "name": "Andhra Pradesh Board for Indian Medicine and Homoeopathy",
            "systemOfMedicine": 7
        },
        {
            "identifier": 1,
            "name": "Andhra Pradesh Medical Council",
            "systemOfMedicine": 1
        }
    ],
    "Message": null
}
```
