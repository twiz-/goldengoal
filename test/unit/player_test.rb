require 'test_helper'

class PlayerTest < ActiveSupport::TestCase
  test "that a Player requires player name" do
    player = Player.new
    assert !player.save
    assert !player.errors[:player_name].empty?
  end
  
  test "That the Player name is at least 2 letters long" do
     player = Player.new
     player.player_name = "H"
     assert !player.save
     assert !player.errors[:player_name].empty?
   end
   
   test "that a Player has a user id" do 
     player = Player.new
     player.player_name = "Tony Ramirez"
     assert !player.save
     assert !player.errors[:user_id].empty?
   end
end
