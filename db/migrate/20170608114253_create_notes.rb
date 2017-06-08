class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.text :content
      t.string :title
      t.string :visibility
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :notes, :users
  end
end
