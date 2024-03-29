class ApplicationController < ActionController::Base
  
  protect_from_forgery

  protected

  def after_sign_in_path_for(resource)
    user_path(id: resource.profile_name)
  end
end
