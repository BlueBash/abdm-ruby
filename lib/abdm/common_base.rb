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

    def send_master_api_request(klass, method_name, params: {}, api_method: :post, search_params: {})
      method_name = method_name.to_s.remove('fetch_')
      base_url    = eval("#{klass}_BASE_URL")
      path        = MASTERAPI_PATH[method_name]
      url         = "#{base_url}/#{path}"

      url         = apply_search_params(url, search_params) if search_params.present?

      params      = {
        body: request_body_params(method_name, params),
        headers: headers_params(klass)
      }

      res = send(api_method, url, params)

      render_response(res)
    end

    private

    def request_body_params(method_name, params)
      params = params.to_options
      params = public_send("params_for_#{method_name}", **params)

      params.is_a?(Hash) ? params.compact.to_json : params
    end

    def apply_search_params(url, search_params)
      return url if search_params.empty?

      search_params.each do |key, value|
        url += url.include?('?') ? "&#{key}=#{value}" : "?#{key}=#{value}"
      end

      url
    end
  end
end
