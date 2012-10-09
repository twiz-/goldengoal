class ProfilesController < PrivateController

  def show
    @players = @user.players.all
    render action: :show
  end

  private 

  def find_user
    @user = User.find_by_profile_name!(params[:id])
  end

end
