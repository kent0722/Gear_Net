class HomeController < ApplicationController
  skip_before_action :require_login, only: %i[top]
  before_action :redirect_if_logged_in, only: %i[top]
  

  def top; end
end
