# Retrieve Professional Document List API

This API retrieves a list of documents associated with a specific health professional. The response includes document identifiers and details which can be used in subsequent API calls to upload documents.


## Important Notes:

1. The `hpr_id` must be provided in the request body.

2. The API returns a list of documents with their identifiers and base64 encoded data where applicable.

3. Handle the base64 encoded data appropriately for document processing or display.


## Parameters:

- `hpr_id`: (String, required) - If you have followed the steps sequentially from Step 1, the `hpr_id` is already stored in the `@client` instance. so you do not need to pass it again. However, if you're directly using this API or working in another context, you must provide the `hpr_id` manually. It should be in the format `71-1231-4343-1358`.


## Method

```ruby
fetch_document_list(
  hpr_id:
)
```

## Request Body:
```ruby
@client.fetch_document_list

or

@client.fetch_document_list(
  hpr_id: '71-1212-1211-1358'
)
```

## Response Body:
```json
{
    "documentList": {
        "profileDetails": {
            "profilePhoto": {
                "id": 29969,
                "data": "base64 string"
            },
            "proofOfWorkCertificate": {
                "id": 29969,
                "data": ""
            }
        },
        "registrationDetails": [
            {
                "registrationCertificate": {
                    "id": 20899,
                    "systemOfMedicide": "modern_medicine",
                    "data": ""
                },
                "proofOfNameChangeRegCertificate": {
                    "id": 20899,
                    "systemOfMedicide": "modern_medicine",
                    "data": ""
                }
            }
        ],
        "qualificationDetails": [
            {
                "degreeCertificate": {
                    "id": 9631,
                    "courseName": "MD - Doctor of Medicine",
                    "qualificationYear": "2020",
                    "data": ""
                },
                "proofOfNameChangeQualCertificate": {
                    "id": 9631,
                    "courseName": "MD - Doctor of Medicine",
                    "qualificationYear": "2020",
                    "data": ""
                }
            }
        ]
    },
    "Message": "Data fetched successfully"
}
```

Use this API to fetch and process document details for health professionals efficiently.