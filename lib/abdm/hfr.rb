require 'abdm/request_body/hfr_creation'
require 'abdm/concerns/hfr/master_apis'

module ABDM
  class Hfr < Base
    include ABDM::RequestBody::HfrCreation
    include Abdm::Hfr::MasterApis

    def search_facility(params = {})
      send_hfr_api_request(__method__, params:)
    end

    def basic_facility_information(params = {})
      generate_x_hprid_token(params)

      params = params.except(:hpr_id, :password)
      send_hfr_api_request(__method__, params:, store_identifiers: 'tracking_id')
    end

    def additional_information(params = {})
      send_hfr_api_request(__method__, params:, store_identifiers: 'tracking_id')
    end

    def detailed_information(params = {})
      send_hfr_api_request(__method__, params:)
    end

    def submit_facility(params = {})
      generate_x_hprid_token(params)

      params = params.except(:hpr_id, :password)
      send_hfr_api_request(__method__, params:)
    end

    private

    def generate_x_hprid_token(params)
      params = params.slice(:hpr_id, :password)
      raise ValidationError.new 'required hpr_id and password' if params.size != 2

      @parsed_response = ABDM::Hpr.new.generate_x_hprid_token(params)
      store_x_hprid_token
    end

    def send_hfr_api_request(method_name, api_method: :post, params:, store_identifiers: nil)
      base_url = HFR_BASE_URL
      path     = PATH_URLS["hfr_#{method_name}"]
      url      = "#{base_url}/#{path}"
      params   = {
        body: request_body_params(method_name, params),
        headers: headers_params(abdm_x_hprid_token: true)
      }
      res      = send(api_method, url, params)

      render_response(res, store_identifiers:)
    end

    def request_body_params(method_name, params)
      params = params.to_options
      params = public_send("params_for_#{method_name}", **params)

      params.is_a?(Hash) ? params.compact.to_json : params
    end
  end
end


