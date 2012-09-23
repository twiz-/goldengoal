class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.string :name
      t.text :comments
      t.date :practice

      t.timestamps
    end
  end
end
