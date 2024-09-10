# Languages API

The Languages API allows you to retrieve a list of languages available in the system. You can filter the list by specifying the name of the language or retrieve all available languages if no filter is applied.


## Parameters

- `language_name` (String, optional) - The name of the language you want to filter by. If not provided, the API will return all languages.


## Method
```ruby
fetch_languages(language_name: )
```


## Request Body 1

To fetch languages filtered by name, use the following method:

```ruby
@client.fetch_languages(language_name: 'english')
```


## Response Body

```json
{
    "piLanguagesList": [
        {
            "identifier": 1,
            "name": "English"
        }
    ],
    "Message": null
}
```


## Request Body 2

To fetch all available languages, use the following method:

```ruby
@client.fetch_languages
```


## Response Body

```json
{
    "piLanguagesList": [
        {
            "identifier": 25,
            "name": "Arabic"
        },
        {
            "identifier": 13,
            "name": "Assamese"
        },
        {
            "identifier": 3,
            "name": "Bengali"
        },
        {
            "identifier": 23,
            "name": "Bodo"
        },
        {
            "identifier": 26,
            "name": "Chinese"
        },
        {
            "identifier": 19,
            "name": "Dogri"
        },
        {
            "identifier": 1,
            "name": "English"
        },
        {
            "identifier": 24,
            "name": "French"
        },
        {
            "identifier": 7,
            "name": "Gujarati"
        },
        {
            "identifier": 2,
            "name": "Hindi"
        },
        {
            "identifier": 9,
            "name": "Kannada"
        },
        {
            "identifier": 16,
            "name": "Kashmiri"
        },
        {
            "identifier": 20,
            "name": "Konkani"
        },
        {
            "identifier": 14,
            "name": "Maithili"
        },
        {
            "identifier": 11,
            "name": "Malayalam"
        },
        {
            "identifier": 22,
            "name": "Manipuri"
        },
        {
            "identifier": 4,
            "name": "Marathi"
        },
        {
            "identifier": 17,
            "name": "Nepali"
        },
        {
            "identifier": 10,
            "name": "Oriya"
        },
        {
            "identifier": 12,
            "name": "Punjabi"
        },
        {
            "identifier": 27,
            "name": "Russian"
        },
        {
            "identifier": 21,
            "name": "Sanskrit"
        },
        {
            "identifier": 15,
            "name": "Santhali"
        },
        {
            "identifier": 18,
            "name": "Sindhi"
        },
        {
            "identifier": 28,
            "name": "Spanish"
        },
        {
            "identifier": 6,
            "name": "Tamil"
        },
        {
            "identifier": 5,
            "name": "Telugu"
        },
        {
            "identifier": 8,
            "name": "Urdu"
        }
    ],
    "Message": null
}
```
