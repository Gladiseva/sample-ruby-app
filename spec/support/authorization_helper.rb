module AuthorizationHelper
  def sign_up(user)
    post '/auth/',
         params: { email: user[:email],
                   password: user[:password],
                   password_confirmation: user[:password] },
         as: :json
  end

  def request_headers(resp)
    {
      'access-token' => resp['access-token'],
      'token-type' => resp['token-type'],
      'client' => resp['client'],
      'expiry' => resp['expiry'],
      'uid' => resp['uid']
    }
  end

  def auth_tokens_for_user(user)
    request_params = {
      email: user[:email],
      password: user[:password]
    }
    post '/auth/sign_in', params: request_params
    request_headers(response.headers)
  end
end
