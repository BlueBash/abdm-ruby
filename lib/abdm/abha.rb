require 'abdm/concerns/m1/registration'
require 'abdm/concerns/m1/login'
require 'abdm/concerns/m1/retrieve'

module Abdm
  class Abha < Base
    include Abdm::M1::Registration
    include Abdm::M1::Login
    include Abdm::M1::Retrieve

    def create_account(document_type, value)
      raise validation_err("document_type is not correct. you can use onlys this #{document_options}") unless document_options.include?(document_type)

      public_send("by_#{document_type}", value)
    end

    def verify_otp(document_type, value, abha_mobile_number)
      raise validation_err("document_type is not correct. you can use onlys this #{document_options}") unless document_options.include?(document_type)

      public_send("verify_#{document_type}_otp", value, abha_mobile_number)
    end

    def update_account(contact_type, value)
      raise validation_err("contact_type is not correct. you can use onlys this #{contact_types}") unless contact_types.include?(contact_type)

      update_mobile_or_email(contact_type, value)
    end

    def verify_otp_for_update(contact_type, value)
      raise validation_err("contact_type is not correct. you can use onlys this #{contact_types}") unless contact_types.include?(contact_type)

      verify_otp_update_mobile_or_email(contact_type, value)
    end

    def suggest_abha_address
      generate_address
    end

    def create_abha_address(address)
      create_address(address)
    end

    def login_via(method, value, password = nil)
      raise validation_err("login_method is not correct. you can use onlys this #{login_methods}") unless login_methods.include?(method)

      if method == 'password'
        raise validation_err("abha number required") unless value.present?
        raise validation_err("password required") unless password.present?

        public_send("login_via_#{method}", value, password)
      else
        public_send("login_via_#{method}", value)
      end
    end

    def login_otp_verify(method, value)
      raise validation_err("login_methode is not correct. you can use onlys this #{login_methods}") unless login_methods.include?(method)

      public_send("login_otp_verify_for_#{method}", value)
    end


    def verify_user(abha_number)
      verify_login_user(abha_number)
    end

    def get_profile
      fetch_profile
    end

    def get_qr_code
      fetch_qr_code
    end

    def get_abha_card
      fetch_abha_card
    end

    private

    def validation_err(message)
      raise Abdm::ValidationError(message)
    end

    def document_options
      %w[aadhaar driving_license]
    end

    def contact_types
      %w[mobile email]
    end

    def login_methods
      %w[aadhaar abha_number mobile password]
    end
  end
end