class ApplicationController < ActionController::Base
  include DeviseTokenAuth::Concerns::SetUserByToken

  include Response
  include ExceptionHandler

  protect_from_forgery with: :exception
end
