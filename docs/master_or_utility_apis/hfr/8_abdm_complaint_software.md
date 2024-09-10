# ABDM Compliant Software API

The `ABDM Compliant Software API` retrieves a list of ABDM Compliant Software codes and their corresponding product names used in the Health Facility Registry (HFR). This information is essential for ensuring that software used is compliant with ABDM standards.


## Notes

1. This API does not require any parameters.

2. The response includes a list of all compliant products with their unique codes and names.

3. If a code is not available, you can use the "anyOther" option in the Basic Facility Information API under `abdmCompliantSoftware`.


## Method
```ruby
fetch_abdm_compliant_software()
```


## Request Body:

```ruby
@client.fetch_abdm_compliant_software
```


## Response Body

```json
[]
```
