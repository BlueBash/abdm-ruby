require 'abdm/concerns/m1/registration'
require 'abdm/concerns/m1/login'
require 'abdm/concerns/m1/retrieve'

module ABDM
  class Abha < Base
    include ABDM::RsaEncryption
    include ABDM::M1::Registration
    include ABDM::M1::Login
    include ABDM::M1::Retrieve

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

    def send_request(method_name, api_method: :post, params: {}, store_identifiers: nil)
      send_api_request('ABHA', method_name, api_method:, params:, store_identifiers:)
    end
  end
end