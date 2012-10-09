class ProfilesController < PrivateController

  def show
    @players = @user.players.all
    render action: :show
  end

end
