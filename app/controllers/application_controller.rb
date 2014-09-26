# Application Controller
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #protect_from_forgery with: :exception
  protect_from_forgery with: :null_session

  before_filter :cors_set_access_control_headers

  # sets CORS headers
  def cors_set_access_control_headers
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'PATCH, DELETE'
    headers['Access-Control-Allow-Headers'] = 'Content-Type'
  end

end
