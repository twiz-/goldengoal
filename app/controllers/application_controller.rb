class ApplicationController < ActionController::Base
  
  include RoutingHelper 

  protect_from_forgery

  protected

  def after_sign_in_path_for(resource)
    profile_path(id: resource.profile_name)
  end
end
