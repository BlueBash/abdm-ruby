# Upload Documents API

This API allows health professionals to upload various documents such as profile photos, degree certificates, and registration certificates. Based on the professional's work type (government or both), a proof of work certificate may also be required.

## Important Notes:
1. For this API, you need to add your `hpr_id` and `password` manually in the configuration file `initializers/abdm.rb`. This will automatically generate the `hpr_token`, which will be submitted with the request body. Users only need to provide the other required data parameters.
2. The `degreeCertificate` and `registrationCertificate` are mandatory.
3. If the health professional's work type is government or both, the `proofOfWorkCertificate` is also required.

## Parameters:
- `document`: (Array, required) - List of documents to be uploaded, each with:
  - `document_id`: (Integer, required) - The ID of the document to be uploaded.
  - `document_type`: (String, required) - The type of document (e.g., `profilePhoto`, `degreeCertificate`, `registrationCertificate`, `proofOfWorkCertificate`).
  - `fileType`: (String, required) - The file type of the document (e.g., `image/jpeg`, `application/pdf`).
  - `data`: (String, required) - The base64-encoded data of the document.


## Method
```ruby
upload_documents(
  documents:
)
```


## Request Body:
```ruby
@client.upload_document(
  documents: [
    {
      "document_id": 1234,
      "document_type": "profilePhoto",
      "fileType": "image/jpeg",
      "data": "<base64 encode string>"
    },
    {
      "document_id": 5678,
      "document_type": "degreeCertificate",
      "fileType": "application/pdf",
      "data": "<base64 encode string>"
    },
    {
      "document_id": 91011,
      "document_type": "registrationCertificate",
      "fileType": "application/pdf",
      "data": "<base64 encode string>"
    },
    {
      "document_id": 1213,
      "document_type": "proofOfWorkCertificate",
      "fileType": "application/pdf",
      "data": "<base64 encode string>"
    }
  ]
)
```

## Response Body:
```json
{
  "profilePhoto": {
    "status": "pass",
    "msg": "Profile pic has been uploaded."
  },
  "degreeCertificate": {
    "status": "pass",
    "msg": "Degree certificate updated"
  },
  "registrationCertificate": {
    "status": "pass",
    "msg": "Registration certificate updated"
  },
  "proofOfWorkCertificate": {
    "status": "pass",
    "msg": "Work proof certificate updated"
  }
}
```

This API helps to ensure all necessary documents for health professionals are uploaded correctly, based on their profession type and other criteria.