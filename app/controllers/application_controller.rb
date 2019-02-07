class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def authenticate_token!
  end
end
