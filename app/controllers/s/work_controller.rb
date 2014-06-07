class S::WorkController < ApplicationController
	layout "supporter_rtc"

  def show
  	@work = Work.find_by(url_token: params[:id])
  end

end
