class Note < ActiveRecord::Base
  attr_accessible :comments, :practice, :user_id
  
  belongs_to :user
end
