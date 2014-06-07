class S::WorkController < ApplicationController
	layout "supporter_rtc"

  def show
  	@work = Work.find_by(url_token: params[:url_token])
  end

end
