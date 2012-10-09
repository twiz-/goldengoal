module RoutingHelper
  # Given the current profile -> nested resources 
  # setup, this helper helps to keep views clean 
  # removing the need to explicitly express the current user
  # as an option for each route.
  #
  def new_player_path
    new_profile_player_path(profile_name)
  end

  def edit_player_path(player) 
    edit_profile_player_path(profile_name, player)
  end

  def players_path
    profile_players_path(profile_name)
  end

  def player_path(player) 
    profile_player_path(profile_name, player)
  end

  def new_note_path 
    new_profile_note_path(profile_name)
  end

  def new_logistic_path
    new_profile_logistic_path(profile_name) 
  end

  def new_logistic_path
    new_profile_logistic_path(profile_name)
  end

  def logistic_path(logistic)
    profile_logistic_path(profile_name, logistic)
  end

  def logistics_path
    profile_logistics_path(profile_name)
  end

  def edit_logistic_path(logistic_path) 
    edit_profile_logistic_path(profile_name, logistic_path)
  end

  private

  def user
   current_user 
  end

  def profile_name
    user.profile_name
  end

end
