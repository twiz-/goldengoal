require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "a user has entered their first name" do
    user = User.new
    assert !user.save
    assert !user.errors[:first_name].empty?  
  end
  
  test "a user has entered their last name" do
    user = User.new
    assert !user.save
    assert !user.errors[:last_name].empty?  
  end
  
  test "a user has entered their profile name" do
    user = User.new
    assert !user.save
    assert !user.errors[:profile_name].empty?  
  end
  
  test "user should have a unique profile name" do
    user = User.new
    user.profile_name = users(:tony).profile_name
    assert !user.save
    assert !user.errors[:profile_name].empty?
  end
  
  test "a user shoeld have a profile name without spaces" do
    user = User.new(first_name: "Tony", last_name: "Ramirez", email: "ramirez.tony11@gmail.com")
    user.password = user.password_confirmation = "asdfasdf"
    
    user.profile_name = " My profile with spaces"
    
    assert !user.save
    assert !user.errors[:profile_name].empty?
    assert user.errors[:profile_name].include?("Must be formatted correctly.")
  end
  
  test "a user can have a correctly formatted profile name " do
    user = User.new(first_name: "Tony", last_name: "Ramirez", email: "ramirez.tony11@gmail.com")
    user.password = user.password_confirmation = "asdfasdf"
    
    user.profile_name = "tmacram1"
    assert user.valid?
  end
end
