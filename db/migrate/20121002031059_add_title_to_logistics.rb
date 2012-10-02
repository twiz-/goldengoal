class AddTitleToLogistics < ActiveRecord::Migration
  def change
    add_column :logistics, :logistic_title, :string
  end
end
