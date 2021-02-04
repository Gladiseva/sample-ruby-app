# /spec/support/helpers/session_helper.rb
module SessionHelper
  def set_request_headers(resp)
    { 'ACCEPT' => 'application/json',
      'Content-Type' => 'application/json',
      'access-token' => resp['access-token'],
      'token-type' => resp['token-type'],
      'client' => resp['client'],
      'expiry' => resp['expiry'],
      'uid' => resp['uid'] }
  end

  def login(user)
    sign_in_url = '/auth/sign_in'
    request_params = {
      email: user.email,
      password: user.password
    }
    post sign_in_url, params: request_params
    set_request_headers(response.headers)
  end
end
