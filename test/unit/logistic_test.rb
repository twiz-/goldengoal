require 'test_helper'

class LogisticTest < ActiveSupport::TestCase
 test "that a logistic requires content" do
   logistic = Logistic.new
   assert !logistic.save
   assert !logistic.errors[:content].empty?
 end
 
 test "That the logisitc content is at least 2 letters long" do
   logistic = Logistic.new
   logistic.content = "H"
   assert !logistic.save
   assert !logistic.errors[:content].empty?
 end
 
 test "That a logistic hase a user id" do
   logistic = Logistic.new
   logistic.content = "Hello"
   assert !logistic.save
   assert !logistic.errors[:user_id].empty?
 end
end
