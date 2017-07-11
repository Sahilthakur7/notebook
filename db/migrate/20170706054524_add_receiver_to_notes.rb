class AddReceiverToNotes < ActiveRecord::Migration
  def change
    add_column :notes, :receiver, :integer
  end
end
