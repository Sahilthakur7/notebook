class CreateDiaries < ActiveRecord::Migration
  def change
    create_table :diaries do |t|
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :diaries, :users
  end
end
