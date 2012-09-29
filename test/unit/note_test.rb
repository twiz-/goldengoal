require 'test_helper'

class NoteTest < ActiveSupport::TestCase
 test "that a note requires content" do
   note = Note.new
   assert !note.save
   assert !note.errors[:comments].empty?
 end
 
 test "that a notes content is at least 2 letters" do
  note = Note.new
  note.comments = "H"
  assert !note.save
  assert !note.errors[:comments].empty?
 end
 
 test "that a note has a user id" do
   note = Note.new
   note.comments = "Hello"
   
   assert !note.save
   assert !note.errors[:user_id].empty?
 end
 
 
 
end
