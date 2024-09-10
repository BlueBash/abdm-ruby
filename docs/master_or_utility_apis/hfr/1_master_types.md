# Master Types API

This API retrieves the list of master data types used in the `Health Facility Registry (HFR)`. These master types are essential for various aspects of facility data, such as facility ownership, types of services, and systems of medicine.

## Notes

1. Create `@client` is an instance of the `ABDM::HFR` class from the `ABDM-ruby` gem Ex: `@client = ABDM::HFR.new`.


2. This is a simple `GET` API with no parameters required.

3. The response contains a list of master data types along with their descriptions.

4. The `type` values in the response should be used in subsequent calls to the `Master Data API` to fetch specific details.


## Request Body
```ruby
@client.fetch_master_types
```

## Response Body
```json
{
  "masterTypes": [
    {
      "type": "MEDICINE",
      "desc": "System Of Medicine"
    },
    {
      "type": "OWNER",
      "desc": "Ownership Of Facility"
    },
    {
      "type": "OWNER-SUBTYPE",
      "desc": "Ownership Subtype Of Facility"
    },
    {
      "type": "CENTRAL-GOVERNMENT",
      "desc": "Ministries under Central Government"
    },
    {
      "type": "PROFIT-TYPE",
      "desc": "Types of Profit Facilities"
    },
    {
      "type": "NON-PROFIT-TYPE",
      "desc": "Types of Non Profit Facilities"
    },
    {
      "type": "FACILITY-TYPE",
      "desc": "Facility Type"
    },
    {
      "type": "TYPE-SERVICE",
      "desc": "Type of Service"
    },
    {
      "type": "SPECIALITIES",
      "desc": "Specialities offered with System of medicine"
    },
    {
      "type": "SALUTATION",
      "desc": "Salutation of Nodal Contacts"
    },
    {
      "type": "FACILITY-REGION",
      "desc": "Facility Region for Demographic details"
    },
    {
      "type": "SPECIALITY-TYPE",
      "desc": "Hospital Speciality Type"
    },
    {
      "type": "ADDRESS-PROOF",
      "desc": "Address Proof Types"
    },
    {
      "type": "FAC-STATUS",
      "desc": "Facility Operational Status"
    },
    {
      "type": "IT-EQUIPMENT",
      "desc": "IT Equipments available in the facility."
    },
    {
      "type": "GENERAL-INFO-OPTIONS",
      "desc": "Options available for questions related to Facility General Information."
    },
    {
      "type": "IMAGING",
      "desc": "Imaging Services offered by the facility"
    },
    {
      "type": "DIAGNOSTIC",
      "desc": "Diagnostic Lab services offered by the facility"
    },
    {
      "type": "DAYS-OF-OPERATION",
      "desc": "Days of Operation offered by the facility"
    },
    {
      "type": "FACILITY-SUB-TYPE",
      "desc": "Facility Sub Type corresponding to Facility Type offered by Facility"
    },
    {
      "type": "SOURCE",
      "desc": "Source available for facility"
    }
  ]
}
```

Once you have retrieved the master types, you can use these values in further calls to the **Master Data API** to fetch detailed information about each master type (e.g., systems of medicine, facility types, ownership types, etc.).
