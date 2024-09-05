# Response and Exception Handling in ABDM-ruby

The `ABDM-ruby` gem provides built-in mechanisms for handling API responses and exceptions. This ensures that developers can interact with the APIs smoothly and receive clear feedback when errors occur.

## Response Handling

When an API call is made, the response is processed using the `render_response` method. This method ensures that:

1. **Validation**: The response is validated by checking its HTTP status code. If the status code is not between `200` and `208`, the gem raises an exception.
2. **Storing Identifiers**: Certain key pieces of information (like `txnId`, `session_token`, etc.) from the response can be stored for use in subsequent API calls.
3. **Parsed Response**: The actual API response is parsed and returned to the user.

### Example:

Here’s an example of generating an Aadhaar OTP and handling the response:

```ruby
@client = ABDM::Abha.new
@client.generate_aadhaar_otp(aadhaar_number: '123456789012')

# Accessing the parsed response
puts @client.parsed_response

# Accessing transaction ID stored from the response
puts @client.transaction_id
```

In this example:
- The `generate_aadhaar_otp` method calls the API.
- The response is parsed and stored within the `@client` object.
- The `parsed_response` method can be used to fetch the response data.

### Storing Identifiers:

Some API responses contain values like `txnId`, `session_token`, etc., which need to be stored for later use. The gem handles this automatically. For instance, the transaction ID from the Aadhaar OTP generation API is stored for reuse in later calls.

### Accessing Stored Identifiers:

After the API call, you can access these stored identifiers easily:

```ruby
# Access transaction ID after Aadhaar OTP generation
puts @client.transaction_id

# Access the parsed API response
puts @client.parsed_response
```

### Response Flow:

- **Success**: If the API call is successful, the parsed response is returned.
- **Failure**: If the API call fails, the gem raises an `APIException` with detailed error messages.




## Exception Handling

If an API call returns an error, the gem raises an `ABDM::APIException`. This exception provides useful information to help you understand why the API request failed.

### Exception Structure

The `APIException` contains the following:

- **response_body**: The full response body returned by the API.
- **response_code**: The HTTP status code of the response.

### Example:

Here’s an example of how to handle exceptions when calling an API:

```ruby
begin
  @client = ABDM::Abha.new
  @client.generate_aadhaar_otp(aadhaar_number: 'invalid_aadhaar_number')
rescue ABDM::APIException => e
  puts "Error occurred: #{e.message}"
  puts "Response Code: #{e.response_code}"
  puts "Response Body: #{e.response_body}"
end
```

In this example:
- If the Aadhaar number is invalid, an `APIException` will be raised.
- The exception message, response code, and response body are available for debugging.


## Summary of Key Points

- **Response Handling**: The gem returns a parsed response by default, allowing you to easily work with the data. Important identifiers like `txnId` are stored for later use.
- **Exception Handling**: If an API request fails, the gem raises an `APIException` with useful details like response code and body, making it easy to debug errors.

