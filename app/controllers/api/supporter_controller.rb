class Api::SupporterController < Api::ApplicationController
  def list
    result = []
    supporters = params[:area_id].presence ? SupporterArea.where(area_id: params[:area_id]) : SupporterArea.all
    supporters.limit(10).each do |sa|
      supporter = sa.supporter
      result.push({
        id: supporter.id,
        name: supporter.profile.name,
        description: supporter.profile.description,
        profile_image: "/assets/#{supporter.profile.profile_image}",
        services: supporter.services.map { |s| { week_name: s.week.name, start_time: s.start_time, end_time: s.end_time } },
        commissions: supporter.commissions.map { |c| { name: c.name } },
      })
    end

    render json: result
  end
end
