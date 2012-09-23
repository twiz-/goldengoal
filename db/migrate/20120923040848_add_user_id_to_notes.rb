class AddUserIdToNotes < ActiveRecord::Migration
  def change
    add_column :notes, :user_id, :integer
    add_index :notes, :user_id
    
    remove_column :notes, :name
  end
end
