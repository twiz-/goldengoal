class Note < ActiveRecord::Base
  attr_accessible :comments, :practice, :user_id, :image, :remote_image_url
  
  belongs_to :user
  mount_uploader :image, ImageUploader
end
