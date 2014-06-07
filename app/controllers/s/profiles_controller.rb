class S::ProfilesController < ApplicationController
	layout "supporter"
	before_filter :setup_profile

  def edit
  end

  def update
  	if @profile.update_attributes(profile_params)
  		@profile.commissions = Commission.find(params[:commissions])
  		@profile.areas = Area.find(params[:areas])
  		@profile.weeks = Week.find(params[:weeks])
  		@profile.save!
  		@profile.supporter_services.each do |ss|
  			ss.update_attributes!(start_time: params[:start][ss.week.id.to_s], end_time: params[:end][ss.week.id.to_s])
  		end
  		redirect_to edit_s_profiles_path
  	else
  		render :edit
  	end
  end

	private

	def setup_profile
		@profile = current_supporter
	end

	def profile_params
    params.require(:supporter).permit({supporter_profile_attributes: [:id, :description]})
  end

end
