class S::HomeController < ApplicationController
  before_action :authenticate_supporter!
	layout "supporter"

  def show
  	# @works = current_supporter.works.where("start_at <= ?", DateTime.now)
  	@works = current_supporter.works
  end
  
end
