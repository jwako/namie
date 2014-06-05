class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  layout :layout_by_resource

  private

  def layout_by_resource
    return "top" if devise_controller?
    return "application"
  end

  def after_sign_in_path_for(resource)
    return u_home_path if resource.is_a?(User)
    return s_home_path if resource.is_a?(Supporter)
  end

  def after_sign_out_path_for(resource)
    reset_session
    return root_path if resource == :user
    return root_path if resource == :supporter
  end

end
