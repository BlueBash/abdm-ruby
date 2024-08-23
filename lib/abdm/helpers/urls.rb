
if ABDMConfig[:environment] == 'sandbox'
  ABHA_BASE_URL = 'https://abhasbx.abdm.gov.in'.freeze
  GATEWAY_URL = 'https://dev.abdm.gov.in/gateway/v0.5/sessions'.freeze
else
  ABHA_BASE_URL = 'https://abha.abdm.gov.in'.freeze
  GATEWAY_URL = ''.freeze
end
