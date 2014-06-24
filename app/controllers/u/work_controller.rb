class U::WorkController < ApplicationController
  before_action :authenticate_user!

  layout "user_rtc"
  def index
    @work = Work.find_by(url_token: params[:url_token])
    @weather = Weather.new(address: @work.address) if @work.address.present?
  end

  def complete
    @work = Work.where(url_token: params[:url_token]).first
    @work.is_finished = true
    @work.save

    begin
      NotifyEventMailer.notify_complete_user(@work).deliver
      NotifyEventMailer.notify_complete_supporter(@work).deliver
    rescue => e
      logger.info e.to_s
    end

    redirect_to u_work_thanks_path
  end

  def thanks
    @work = Work.where(url_token: params[:url_token]).first
    if request.patch?
      @work.greeting_message = work_params[:greeting_message]
      @work.save!
    end
  end

  def work_params
    params.require(:work).permit(:greeting_message)
  end
end
