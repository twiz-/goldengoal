class AddUserIdToLogistics < ActiveRecord::Migration
  def change
    add_column :logistics, :user_id, :integer
    add_index :logistics, :user_id
    
    remove_column :logistics, :name
  end
end
