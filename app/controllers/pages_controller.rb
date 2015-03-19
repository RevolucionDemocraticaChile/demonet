class PagesController < ApplicationController

  skip_authorization_check :only => [:welcome]
  skip_before_filter :check_session, :only => [:welcome]
  # skip_before_filter :miniprofiler, :only => [:welcome]

  def welcome
    redirect_to ingresar_path unless signed_in?
  end

end
