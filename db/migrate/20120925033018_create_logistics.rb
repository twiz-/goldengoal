class CreateLogistics < ActiveRecord::Migration
  def change
    create_table :logistics do |t|
      t.string :name
      t.text :content

      t.timestamps
    end
  end
end
