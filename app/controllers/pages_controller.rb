class PagesController < ApplicationController

  skip_authorization_check :only => [:welcome]
  skip_before_filter :check_session, :only => [:welcome]

  def welcome
  end

end
