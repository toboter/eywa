class RenameUserToAccount < ActiveRecord::Migration
  def change
    rename_table :users, :accounts
  end 
end
