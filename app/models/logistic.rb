class Logistic < ActiveRecord::Base
  attr_accessible :content, :user_id, :logistic_title
  
  belongs_to :user
  
  validates :content, presence: :true,
                      length: {minimum: 2}
                      
  validates :user_id, presence: :true   
  validates :logistic_title, presence: :true                 
  
end
