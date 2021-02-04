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

  def create_auth_header_from_scratch
    @current_user = FactoryBot.create(:user)

    token = DeviseTokenAuth::TokenFactory.create

    @current_user.tokens[token.client] = {
      token: token.token_hash,
      expiry: token.expiry
    }

    new_auth_header = @current_user.build_auth_header(token.token, token.client)

    response.headers.merge!(new_auth_header)
  end
end
