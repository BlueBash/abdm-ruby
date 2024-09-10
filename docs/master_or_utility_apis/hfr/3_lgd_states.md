# LGD States API

The `LGD States API` fetches the Local Government Directory (LGD) codes for all states and their districts as per [https://lgdirectory.gov.in](https://lgdirectory.gov.in). This is used in the HFR system to define and validate demographic data for healthcare facilities.


## Notes

1. This is a basic GET API and no parameters are required.

2. The response provides a list of all states with their LGD code and a sub-list of districts and their LGD codes.

3. All HFR APIs will only accept the `code` for demographic fields where master data is defined.


## Request Body
```ruby
@client.fetch_lgd_states
```

## Response Body
```json
[
    {
        "code": "35",
        "name": "ANDAMAN AND NICOBAR ISLANDS",
        "districts": [
            {
                "code": "603",
                "name": "NICOBARS"
            },
            {
                "code": "632",
                "name": "NORTH AND MIDDLE ANDAMAN"
            },
            {
                "code": "602",
                "name": "SOUTH ANDAMANS"
            }
        ]
    },
    {
        "code": "28",
        "name": "ANDHRA PRADESH",
        "districts": [
            {
                "code": "745",
                "name": "Alluri Sitharama Raju"
            },
            {
                "code": "744",
                "name": "Anakapalli"
            },
            {
                "code": "502",
                "name": "Ananthapuramu"
            },
            {
                "code": "753",
                "name": "Annamayya"
            }
        ]
    },
    //...other states and districts
]
```

Now that you have retrieved the LGD codes, you can use these codes in subsequent API calls that require state and district demographic data for facility registration or updates.
