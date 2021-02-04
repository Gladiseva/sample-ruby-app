class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :verify_authenticity_token

  include DeviseTokenAuth::Concerns::SetUserByToken

  include Response
  include ExceptionHandler
end
