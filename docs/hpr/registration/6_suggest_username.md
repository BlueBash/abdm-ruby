# HPR Registration - Get Username Suggestions

This API provides username suggestions based on the Aadhaar information and transaction ID generated from the OTP verification step. It returns a list of suggested usernames that the user can choose from for their HPRID account.

## Parameters

- No parameter required for this step.

## Method

```ruby
suggest_username()
```


## Request Body

```ruby
@client.suggest_username
```

## Response Body

```json
[
    "bikashchoudhary",
    "choudhary1997",
    "bikashchoudhary2281997",
    "bikash.choudhary",
    "choudhary228"
]
```

Once the user selects a username from the suggested list, they can proceed with HPRID account creation.
