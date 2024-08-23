## **Installation Guide for ABDM-ruby**

### **Overview**

The `ABDM-ruby` gem allows you to integrate seamlessly with the Ayushman Bharat Digital Mission (ABDM) APIs, enabling functionalities such as managing health records, generating ABHA numbers, and more. This guide will walk you through the installation process required to use the gem.

### **Prerequisites**

Before installing the `abdm-ruby` gem, ensure that your environment meets the following prerequisites:

- **Ruby version**: Ensure you are running Ruby 3.1 or later.
- **Bundler**: Make sure Bundler is installed for managing gem dependencies. You can install Bundler by running:

  ```bash
  gem install bundler
  ```

### **Step 1: Add to Your Gemfile**

To install the `abdm-ruby` gem, add it to your project's `Gemfile`:

```ruby
gem 'abdm-ruby'
```

Then, run `bundle install` to install the gem and its dependencies:

```bash
bundle install
```

### **Step 2: Install via Command Line**

Alternatively, you can install the gem directly from the command line:

```bash
gem install abdm-ruby
```

### **Verify the Installation**

To verify that the gem has been installed correctly, run the following command to check the version:

```bash
bundle show abdm-ruby
```

If this command outputs the path of `abdm-ruby` without errors, the gem is installed successfully.

### **Troubleshooting**

- **Common Errors**: If you encounter any installation errors, such as missing dependencies or incorrect Ruby versions, ensure your environment meets the prerequisites.

#### After installation, the next step is to set up the configuration for `ABDM-ruby`. Please refer to the [**Configuration Guide**](2_configuration.md) for detailed instructions.
