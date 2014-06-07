class U::WorkController < ApplicationController
	layout "user_rtc"

  def index
  	@work = Work.find_by(url_token: params[:id])
  end

end
