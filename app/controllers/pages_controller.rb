class PagesController < ApplicationController
  skip_before_action :require_login, only: %i[Terms_of_use policy]
  def Terms_of_use; end

  def policy; end
end
