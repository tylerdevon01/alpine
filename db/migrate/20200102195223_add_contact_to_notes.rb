class AddContactToNotes < ActiveRecord::Migration[6.0]
  def change
    add_reference :notes, :contact, null: false, foreign_key: true
  end
end
