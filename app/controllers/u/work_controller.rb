class U::WorkController < ApplicationController
  layout "user_rtc"
  def index
    @work = Work.find_by(url_token: params[:id])
  end

  def thanks
    @work = Work.where(url_token: params[:url_token]).first
    @work.is_finished = true
    @work.save
  end
end
