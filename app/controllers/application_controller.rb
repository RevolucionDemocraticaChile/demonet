class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper

  # before_filter :check_session

  private

    def check_session
      if current_user.nil?
        raise ActionController::RoutingError.new('Not Found')
      end
    end

end
