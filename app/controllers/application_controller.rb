class ApplicationController < ActionController::Base

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper

  before_filter :check_session
  before_filter :miniprofiler
  check_authorization

  rescue_from CanCan::AccessDenied do |e|
    flash[:error] = e.message
    redirect_to root_path
  end

private

  def check_session
    if current_user.nil?
      flash[:error] = t(:signin_first)
      redirect_to ingresar_path
    end
  end

  def miniprofiler
    Rack::MiniProfiler.authorize_request if current_user.admin?
  end

end
