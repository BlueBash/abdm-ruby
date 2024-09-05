module ABDM
  module CommonBase
    def send_api_request(klass, method_name, api_method:, params:, store_identifiers:)
      base_url = eval("#{klass}_BASE_URL")
      path     = PATH_URLS["#{klass.downcase}_#{method_name}"]
      url      = "#{base_url}/#{path}"
      params   = {
        body: request_body_params(method_name, params),
        headers: headers_params(klass)
      }
      res      = send(api_method, url, params)

      render_response(res, store_identifiers:)
    end

    private

    def request_body_params(method_name, params)
      params = params.to_options
      params = public_send("params_for_#{method_name}", **params)

      params.is_a?(Hash) ? params.compact.to_json : params
    end
  end
end
