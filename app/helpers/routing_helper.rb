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

  def new_logistic_path(*options)
    new_profile_logistic_path(profile_name, *options)
  end

  def logistic_path(logistic, *options)
    profile_logistic_path(profile_name, logistic, *options)
  end

  def logistics_path(*options)
    profile_logistics_path(profile_name, *options)
  end

  def edit_logistic_path(logistic_path) 
    edit_profile_logistic_path(profile_name, logistic_path)
  end

  def new_note_path 
    new_profile_note_path(profile_name)
  end

  def notes_path(*options)
    profile_notes_path(profile_name, *options)
  end

  def note_path(note, *options) 
    profile_note_path(profile_name, note, *options)
  end

  def edit_note_path(note)
    edit_profile_note_path(profile_name, note)
  end

  private

  def user
   current_user 
  end

  def profile_name
    user.profile_name
  end

end
