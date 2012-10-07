class Player < ActiveRecord::Base
  attr_accessible :player_name, :user_id
  
  belongs_to :user
  
  validates :player_name, presence: true,
                        length: { minimum: 2 }
                        
                        
  validates :user_id, presence: true                        
                          
                          
                          
end
