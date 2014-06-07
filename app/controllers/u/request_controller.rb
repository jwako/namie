class U::RequestController < ApplicationController
  def index
  end

  def confirm
  end

  def complete
    redirect_to u_request_thanks_path
  end

  def thanks
  end
end
