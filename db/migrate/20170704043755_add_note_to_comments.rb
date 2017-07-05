class AddNoteToComments < ActiveRecord::Migration
  def change
    add_reference :comments, :note, index: true
    add_foreign_key :comments, :notes
  end
end
