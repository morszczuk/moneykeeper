class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :require_authentication
    
  def require_authentication
      authenticate_or_request_with_http_basic do |u,p|
          true if u==ENV['AUTH_USER'] && p==ENV['AUTH_PASSWORD']
      end
  end
  # http_basic_authenticate_with user: ENV["AUTH_USER"].to_s, password: ENV["AUTH_PASSWORD"].to_s
end
