class Api::SupporterController < Api::ApplicationController
  def list
    result = []
    return render json: result unless params[:area_id]

    area = Area.where(id: params[:area_id]).first
    SupporterArea.where(area_id: area.id).each do |sa|
      supporter = sa.supporter
      result.push({
        id: supporter.id,
        name: supporter.profile.name,
        profile_image: supporter.profile.profile_image,
        services: supporter.services.map { |s| { week_name: s.week.name, start_time: s.start_time, end_time: s.end_time } },
        commissions: supporter.commissions.map { |c| { name: c.name } },
      })
    end

    render json: result
  end
end
