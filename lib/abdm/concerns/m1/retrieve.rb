# frozen_string_literal: true

module ABDM::M1
  module Retrieve

    %w[profile qr_code abha_card].each do |method_name|
      define_method("fetch_#{method_name}") do
        uri = request_uri_for_fetch[method_name]
        res = get(uri, request_body_for_retrieve)

        render_response(res)
      end
    end

    private

    def request_body_for_retrieve
      { headers: headers_params(request_id: true, time_stamp: true, abdm_x_token: true) }
    end

    def request_uri_for_fetch
      {
        profile: "#{ABHA_BASE_URL}/abha/api/v3/profile/account",
        qr_code: "#{ABHA_BASE_URL}/abha/api/v3/profile/account/qrCode",
        abha_card: "#{ABHA_BASE_URL}/abha/api/v3/profile/account/abha-card"
    }.as_json
    end
  end
end
