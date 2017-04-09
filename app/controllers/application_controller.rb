class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  before_filter :require_login

  private

  def require_login
    redirect_to login_url unless logged_in?
  end
end
