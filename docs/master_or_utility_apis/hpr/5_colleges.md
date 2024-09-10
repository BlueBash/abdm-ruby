# Colleges API

The Colleges API is used to fetch a list of colleges existing in the HPR (Health Professional Registry). You can filter the colleges based on parameters provided in the payload.


## Parameters

- `identifier` (String, optional) - The unique identifier of the college. If provided, this will fetch the details of the specific college.
- `category` (String, required) - The category of the college. Can be:
  - `doctor`
  - `nurse`
- `subcategory` (String, optional) - The system of medicine for doctors or category for nurses. For doctors, the subcategories are:
  1. Modern Medicine
  2. Dentistry
  3. Homoeopathy
  4. Ayurveda
  5. Unani
  6. Siddha
  7. Sowa-Rigpa
- For nurses, the `subcategory` parameter is not applicable.


## Method
```ruby
fetch_colleges(
  identifier:,
  category:,
  subcategory:
)
```


## Request Body 1

To fetch colleges with a specific identifier:

```ruby
@client.fetch_colleges(identifier: "1838")
```


## Response Body


```json
{
  "collegesList": [
    {
      "identifier": 1838,
      "name": "Academy of Hospital Administration",
      "systemOfMedicine": 1,
      "stateName": "Uttar Pradesh",
      "stateISO": "9"
    }
  ],
  "Message": null
}
```

## Request Body 2

To fetch a list of all colleges:

```ruby
@client.fetch_colleges
```


## Response Body
```json
{
  "resultCount": 28791,
  "collegesList": [
    {
      "identifier": 76142,
      "name": "",
      "systemOfMedicine": "0",
      "stateName": "West Bengal",
      "stateISO": "19"
    },
    {
      "identifier": 65913,
      "name": "",
      "systemOfMedicine": "0",
      "stateName": "Punjab",
      "stateISO": "3"
    },
    {
      "identifier": 107188,
      "name": "A A SIRASAGI DIPLOMA IN PHARMACY SIRASAGI ADARSH GROUP OF TRUST KALAKERI TQ SINDAGI DIST VIJAYAPUR",
      "systemOfMedicine": "13",
      "stateName": "Karnataka",
      "stateISO": "29"
    },
    {
      "identifier": 107189,
      "name": "A And E College Of Pharmacy",
      "systemOfMedicine": "13",
      "stateName": "Bihar",
      "stateISO": "10"
    },
    {
      "identifier": 107190,
      "name": "A AND H COLLEGE OF PHARMACY",
      "systemOfMedicine": "13",
      "stateName": "Uttar Pradesh",
      "stateISO": "9"
    },
    {
      "identifier": 107191,
      "name": "A B COLLEGE OF PHARMACY",
      "systemOfMedicine": "13",
      "stateName": "Uttar Pradesh",
      "stateISO": "9"
    },
    {
      "identifier": 107192,
      "name": "A B PHARMACY COLLEGE",
      "systemOfMedicine": "13",
      "stateName": "Uttar Pradesh",
      "stateISO": "9"
    },
    {
      "identifier": 107193,
      "name": "A B Singh College Of Pharmacy",
      "systemOfMedicine": "13",
      "stateName": "Uttar Pradesh",
      "stateISO": "9"
    },
    {
      "identifier": 107194,
      "name": "A D R COLLEGE OF PHARMACY",
      "systemOfMedicine": "13",
      "stateName": "Uttar Pradesh",
      "stateISO": "9"
    },
    {
      "identifier": 107195,
      "name": "A D S COLLEGE",
      "systemOfMedicine": "13",
      "stateName": "Madhya Pradesh",
      "stateISO": "23"
    },
    {
      "identifier": 73610,
      "name": "A D S SCHOOL AND COLLEGE OF NURSING,MORENA M.P.",
      "systemOfMedicine": "0",
      "stateName": "Uttar Pradesh",
      "stateISO": "9"
    },
    {
      "identifier": 69300,
      "name": "A E C S PAVAN SCHOOL OF NURSING KOLAR",
      "systemOfMedicine": "0",
      "stateName": "Tamil Nadu",
      "stateISO": "33"
    },
    {
      "identifier": 67905,
      "name": "A E C S PAVAN SCHOOL OF NURSING KOLAR",
      "systemOfMedicine": "0",
      "stateName": "Rajasthan",
      "stateISO": "8"
    },
    {
      "identifier": 107196,
      "name": "A G COLLEGE OF PHARMACY",
      "systemOfMedicine": "13",
      "stateName": "Jharkhand",
      "stateISO": "20"
    },
    {
      "identifier": 425,
      "name": "Zydus Medical College and Hospital",
      "systemOfMedicine": null,
      "stateName": "Gujarat",
      "stateISO": "24"
    }
  ],
  "Message": null
}
```

If you do not provide any parameters, the API will return a list of all colleges.