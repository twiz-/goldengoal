class Player < ActiveRecord::Base
  attr_accessible :player_name, :user_id
  
  belongs_to :user
  
end
