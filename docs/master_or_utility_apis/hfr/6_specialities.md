# Get Specialities API

The `Get Specialities API` provides a list of specialities, specializations, or services offered under HFR for a specific System of Medicine.


## Notes

1. The `system_of_medicine_code` is mandatory and should correspond to a system of medicine available in HFR.

2. You can pass only a single `system_of_medicine_code` in the request.


## Parameters

- `system_of_medicine_code`: (String, required) - The System of Medicine code for which you want to retrieve the specialities. Accepted codes can be found using the `Master Data API` with `type="MEDICINE"`.


## Method
```ruby
fetch_specialities(
  system_of_medicine_code:
)
```


## Request Body

```ruby
@client.fetch_specialities(system_of_medicine_code: 'M')
```


## Response Body

```json
{
    "type": "SPECIALITIES",
    "data": [
        {
            "code": "M-S1",
            "value": "General Medicine"
        },
        {
            "code": "M-S35",
            "value": "Family Medicine"
        },
        {
            "code": "M-S36",
            "value": "Emergency Medicine"
        },
        {
            "code": "M-S20",
            "value": "Obstetrics and Gynecology"
        },
        {
            "code": "M-S2",
            "value": "Pediatrics"
        },
        {
            "code": "M-S19",
            "value": "General Surgery"
        },
        {
            "code": "M-S21",
            "value": "Orthopaedics"
        },
        {
            "code": "M-S23",
            "value": "ENT"
        },
        {
            "code": "M-S16",
            "value": "Anaesthesia"
        },
        {
            "code": "M-S24",
            "value": "Ophthalmology"
        },
        {
            "code": "M-S25",
            "value": "Urology"
        },
        {
            "code": "M-S18",
            "value": "Critical Care"
        },
        {
            "code": "M-S37",
            "value": "Radiology"
        },
        {
            "code": "M-S4",
            "value": "Pulmonology (Chest diseases and respiratory medicine)"
        },
        {
            "code": "M-S8",
            "value": "Gastroenterology"
        },
        {
            "code": "M-S5",
            "value": "Dermatology and Venerology (Skin & VD)"
        },
        {
            "code": "M-S3",
            "value": "Neonatology"
        },
        {
            "code": "M-S10",
            "value": "Dialysis"
        },
        {
            "code": "M-S6",
            "value": "Cardiology"
        },
        {
            "code": "M-S11",
            "value": "Psychiatry"
        },
        {
            "code": "M-S12",
            "value": "Geriatrics"
        },
        {
            "code": "M-S15",
            "value": "Neurology"
        },
        {
            "code": "M-S41",
            "value": "Polytrauma"
        },
        {
            "code": "M-S9",
            "value": "Nephrology"
        },
        {
            "code": "M-S26",
            "value": "Neurosurgery"
        },
        {
            "code": "M-S27",
            "value": "Burns, Plastic & Reconstructive Surgery"
        },
        {
            "code": "M-S22",
            "value": "Paediatric Surgery"
        },
        {
            "code": "M-S33",
            "value": "Oncology"
        },
        {
            "code": "M-S40",
            "value": "Genitourinary Surgery"
        },
        {
            "code": "M-S14",
            "value": "Endocrinology"
        },
        {
            "code": "M-S13",
            "value": "Rheumatology"
        },
        {
            "code": "M-S7",
            "value": "Cath Lab"
        },
        {
            "code": "M-S28",
            "value": "Medicolegal/Forensic Medicine"
        },
        {
            "code": "M-S38",
            "value": "Hepatology"
        },
        {
            "code": "M-S29",
            "value": "Interventional Cardiology"
        },
        {
            "code": "M-S17",
            "value": "Cardiothoracic and Vascular Surgery"
        },
        {
            "code": "M-S39",
            "value": "Immunology"
        },
        {
            "code": "M-S34",
            "value": "Neuroradiology"
        },
        {
            "code": "M-S42",
            "value": "Paediatric Cancer"
        },
        {
            "code": "M-S32",
            "value": "Genetics"
        },
        {
            "code": "M-S31",
            "value": "Nuclear Medicine"
        },
        {
            "code": "M-S30",
            "value": "Aviation Medicine"
        }
    ]
}
```
