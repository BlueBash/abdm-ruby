# Countries API

The Countries API is used to fetch a list of countries. You can filter the countries based on their name or identifier.


## Parameters

- `country_name` (String, optional) - The name of the country to filter by.

- `identifier` (Integer, optional) - The identifier of the country to filter by.


## Method
```ruby
fetch_countries(
  country_name:
  identifier:
)
```

## Request Body 1

To fetch countries with a specific name filter:

```ruby
@client.fetch_countries(
  country_name: 'india'
)
```

## Response Body

```json
{
    "countriesList": [
        {
            "identifier": 86,
            "name": "British Indian Ocean Territory",
            "alpha_2_code": "IO",
            "alpha_3_code": "IOT",
            "nationality": "BIOT"
        },
        {
            "identifier": 356,
            "name": "India",
            "alpha_2_code": "IN",
            "alpha_3_code": "IND",
            "nationality": "Indian"
        }
    ],
    "Message": null
}
```

## Request Body 2

To fetch a list of all countries:

```ruby
@client.fetch_countries
```

## Response Body

```json
{
    "countriesList": [
        {
            "identifier": 4,
            "name": "Afghanistan",
            "alpha_2_code": "AF",
            "alpha_3_code": "AFG",
            "nationality": "Afghan"
        },
        {
            "identifier": 248,
            "name": "Åland Islands",
            "alpha_2_code": "AX",
            "alpha_3_code": "ALA",
            "nationality": "Åland Island"
        },
        {
            "identifier": 8,
            "name": "Albania",
            "alpha_2_code": "AL",
            "alpha_3_code": "ALB",
            "nationality": "Albanian"
        },
        {
            "identifier": 12,
            "name": "Algeria",
            "alpha_2_code": "DZ",
            "alpha_3_code": "DZA",
            "nationality": "Algerian"
        },
        {
            "identifier": 16,
            "name": "American Samoa",
            "alpha_2_code": "AS",
            "alpha_3_code": "ASM",
            "nationality": "American Samoan"
        },
        {
            "identifier": 20,
            "name": "Andorra",
            "alpha_2_code": "AD",
            "alpha_3_code": "AND",
            "nationality": "Andorran"
        },
        {
            "identifier": 24,
            "name": "Angola",
            "alpha_2_code": "AO",
            "alpha_3_code": "AGO",
            "nationality": "Angolan"
        },
        {
            "identifier": 660,
            "name": "Anguilla",
            "alpha_2_code": "AI",
            "alpha_3_code": "AIA",
            "nationality": "Anguillan"
        },
        {
            "identifier": 716,
            "name": "Zimbabwe",
            "alpha_2_code": "ZW",
            "alpha_3_code": "ZWE",
            "nationality": "Zimbabwean"
        }
    ],
    "Message": null
}
```

## Notes

- The `country_name` field is used to filter the countries by their name.
- The `identifier` field can be used to filter countries by their unique identifier.
- If no parameters are provided, the API will return a list of all available countries.
