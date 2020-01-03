class AddContactToTasks < ActiveRecord::Migration[6.0]
  def change
    add_reference :tasks, :contact, null: false, foreign_key: true
  end
end
