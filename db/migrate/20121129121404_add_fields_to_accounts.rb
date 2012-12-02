class AddFieldsToAccounts < ActiveRecord::Migration
  def change
  	add_column :accounts, :type, :string
  	add_column :accounts, :deactivated, :boolean
  end
end
