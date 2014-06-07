class U::HomeController < ApplicationController
  before_action :authenticate_user!

  def show
    @works = current_user.works
  end
end
