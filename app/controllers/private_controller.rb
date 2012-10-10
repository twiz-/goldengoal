class PrivateController < ApplicationController
  before_filter :authenticate_user! 
  before_filter :find_user
  before_filter :guard_user

  protected 
  
  def find_user
    @user = User.find_by_profile_name!(params[:user_id])
  end

  def guard_user
    if @user != current_user
      raise ActiveRecord::RecordNotFound 
    end
  end

end
