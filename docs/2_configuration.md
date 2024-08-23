
## **Configuration for ABDM-ruby**

### **Configuration**

After installing the `ABDM-ruby` gem, you need to configure it to connect to the ABDM API. For Rails applications, the `abdm-ruby` gem provides a convenient generator command to set up the initial configuration.

### **Step 1: Using the Generator Command (Rails Only)**

To create the initializer file with the default configuration settings, run the following command in your Rails application:

```bash
rails generate abdm:initializer
```

This command will generate an initializer file at `config/initializers/abdm.rb` with the following template:

```ruby
# Configuration for ABDM integration
#
# You need to set the client_id and client_secret and environment.
# By default, the environment is set to 'production'. You can change it to 'sandbox'.
#
# Example:
ABDMConfig = {
  environment: 'production', # or 'sandbox'
  client_id: 'your_client_id',
  client_secret: 'your_client_secret'
}
```

### **Step 2: Customizing the Configuration**

1. **Set Your Client ID and Secret**: Replace `'your_client_id'` and `'your_client_secret'` with your actual credentials.

2. **Environment**: Choose the environment based on your needs:
   - `'sandbox'` for testing and development.
   - `'production'` for live deployment.

### **Quick Usage Example**

Once configured, you can start using the gem to interact with the ABDM APIs. Here's a quick example to fetch a session token:

```ruby
# Initialize the ABDM class
abdm_client = ABDM::Client.new

# Fetch the session token
begin
  session_token = abdm_client.fetch_session_token
  puts "Session token fetched successfully: #{session_token}"
rescue => e
  puts "Error fetching session token: #{e.message}"
end
```

If the script runs without errors and prints the session token, the configuration was successful.

### **Conclusion**

You have successfully configured the `abdm-ruby` gem for use in your application. You can now proceed to use the gem's various features to interact with the ABDM APIs.
