class U::RequestController < ApplicationController
  before_action :authenticate_user!

  def index
    @work = Work.new
  end

  def confirm
    @work = Work.new(work_params)
    @work.commissions = Commission.find(params[:commissions]) if params[:commissions].present?
    @work.user = current_user

    return render :index unless @work.valid?
    @work.save!
  end

  def complete
    redirect_to u_request_thanks_path
  end

  def thanks
  end

  private

  def work_params
    params.require(:work).permit(:address, :supporter_id, :start_at)
  end
end
