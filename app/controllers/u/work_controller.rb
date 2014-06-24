class U::WorkController < ApplicationController
  before_action :authenticate_user!

  layout "user_rtc"
  def index
  	@work = Work.find_by(url_token: params[:url_token])
  	@weather = Weather.new(address: @work.address) if @work.address.present?
  end

  def thanks
    @work = Work.where(url_token: params[:url_token]).first
    @work.is_finished = true
    @work.save
  end
end
