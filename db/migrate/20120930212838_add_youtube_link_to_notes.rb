class AddYoutubeLinkToNotes < ActiveRecord::Migration
  def change
    add_column :notes, :link, :string
  end
end
