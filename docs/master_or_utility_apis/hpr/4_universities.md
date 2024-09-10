# Universities API

The Universities API allows you to retrieve a list of universities available in the system. You can filter the list by specifying the name of the university or retrieve all available universities if no filter is applied.


## Parameters

- `university_name` (String, optional) - The name of the university you want to filter by. If not provided, the API will return all universities.


## Method
```ruby
fetch_universities(university_name: )
```

## Request Body 1

To fetch universities filtered by name, use the following method:

```ruby
@client.fetch_universities(
  university_name: "Academy of Hospital Administration, Noida"
)
```

## Response Body
```json
{
    "universitesList": [
        {
            "identifier": 362,
            "name": "Academy of Hospital Administration, Noida",
            "collegeName": "Academy of Hospital Administration",
            "collegeId": 1838
        }
    ],
    "Message": null
}
```


## Request Body 2

To fetch all available universities, use the following method:

```ruby
@client.fetch_universities
```

## Response Body

```json
{
    "universitesList": [
        {
            "identifier": 40384,
            "name": "ABCD",
            "collegeName": "Katihar Medical College",
            "collegeId": 5
        },
        {
            "identifier": 362,
            "name": "Academy of Hospital Administration, Noida",
            "collegeName": "Academy of Hospital Administration",
            "collegeId": 1838
        },
        {
            "identifier": 6001,
            "name": "Adesh University, Bathinda (2012-Present)",
            "collegeName": "Adesh Institute Of Medical Sciences And Research, Bhatinda",
            "collegeId": 1
        },
        {
            "identifier": 2,
            "name": "Al-Falah University",
            "collegeName": "Al Falah School of Medical Sciences and Research Centre",
            "collegeId": 3
        },
        {
            "identifier": 4,
            "name": "Al-karim University, Katihar",
            "collegeName": "Katihar Medical College",
            "collegeId": 5
        },
        {
            "identifier": 3,
            "name": "Aligarh Muslim University",
            "collegeName": "Dr. Ziauddin Ahmad Dental College",
            "collegeId": 1338
        },
        {
            "identifier": 40381,
            "name": "yes1",
            "collegeName": "Adesh Institute Of Medical Sciences And Research, Bhatinda",
            "collegeId": 1
        }
    ],
    "Message": null
}
```
