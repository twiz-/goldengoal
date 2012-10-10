class Note < ActiveRecord::Base
  attr_accessible :comments, :practice, :image, :remote_image_url,:link
  
  belongs_to :user
  validates :comments, presence: true,
                     length: { minimum: 2}
                     
  validates :user_id, presence: true 
  validates :practice, presence: true                   
                      
  mount_uploader :image, ImageUploader
  
end
