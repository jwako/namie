class U::RequestController < ApplicationController
  before_action :authenticate_user!

  def index
    @work = Work.new
  end

  def complete
    @work = Work.new(work_params)
    @work.commissions = Commission.find(params[:commissions]) if params[:commissions].present?
    @work.user = current_user

    return render :index unless @work.valid?
    @work.save!

    begin
      NotifyEventMailer.notify_register_user(@work).deliver
      NotifyEventMailer.notify_register_supporter(@work).deliver
    rescue => e
      logger.info e.to_s
    end

    redirect_to u_request_thanks_path
  end

  def thanks
    @work = Work.where(user_id: current_user.id).last
  end

  private

  def work_params
    params.require(:work).permit(:address, :supporter_id, :start_at)
  end
end
