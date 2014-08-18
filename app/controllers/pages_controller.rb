class PagesController < ApplicationController

  skip_authorization_check :only => [:welcome]

  def welcome
  end

end
