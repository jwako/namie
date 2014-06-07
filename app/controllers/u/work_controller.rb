class U::WorkController < ApplicationController
  def index
  end

  def thanks
    @work = Work.where(url_token: params[:url_token]).first
    @work.is_finished = true
    @work.save
  end
end
