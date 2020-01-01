class CreateGroupsContactsJoinTable < ActiveRecord::Migration[6.0]
  def change
    # If you want to add an index for faster querying through this join:
    create_join_table :groups, :contacts do |t|
      t.index :group_id
      t.index :contact_id
    end
  end
end
