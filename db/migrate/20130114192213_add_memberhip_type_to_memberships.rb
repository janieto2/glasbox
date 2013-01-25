class AddMemberhipTypeToMemberships < ActiveRecord::Migration
  def change
    add_column :memberships, :membership_type, :string
    add_column :memberships, :user_id, :integer
    add_index :memberships, :user_id
  end
end
