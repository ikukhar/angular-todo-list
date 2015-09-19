class ApplicationController < ActionController::Base
  include DeviseTokenAuth::Concerns::SetUserByToken

  # Prevent CSRF attacks by using :null_session
  protect_from_forgery with: :null_session

  respond_to :json
end
