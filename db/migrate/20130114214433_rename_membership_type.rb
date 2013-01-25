class RenameMembershipType < ActiveRecord::Migration
	def change
		remove_column :memberships, :membership_type
		add_column :memberships, :plan_id, :integer
	end
end
