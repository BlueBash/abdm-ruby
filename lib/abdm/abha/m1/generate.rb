# frozen_string_literal: true

module Abdm
  module Abha
    class M1::Generate < Abdm::Base

      # Fetches the ABHA profile based on the provided JWT access token.
      def profile(params)
        get('/api/v3/profile/account', params)
      end

      # Generates a QR code for the ABHA profile.
      def qr_code(params)
        get('/api/v3/profile/qrCode', params)
      end

      # Generates an ABHA card based on the provided JWT access token.
      def abha_card(params)
        get('/api/v3/profile/account/abha-card', params)
      end
    end
  end
end