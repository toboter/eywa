class RenameUserIdToAccountIdInMemberships < ActiveRecord::Migration
  def up
  	rename_column :memberships, :user_id, :account_id
  end

  def down
  	rename_column :memberships, :account_id, :user_id
  end
end
