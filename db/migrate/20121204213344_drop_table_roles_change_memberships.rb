class DropTableRolesChangeMemberships < ActiveRecord::Migration
  def up
  	remove_column :memberships, :role_id
  	add_column :memberships, :role, :string
  end

  def down
    add_column :memberships, :role_id, :integer
  	remove_column :memberships, :role
  end
end
