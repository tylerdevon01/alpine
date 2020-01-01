class AddLabelToContacts < ActiveRecord::Migration[6.0]
  def change
    add_column :contacts, :label, :text
  end
end
