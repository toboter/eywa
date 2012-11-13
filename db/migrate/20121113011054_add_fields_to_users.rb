class AddFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :fullname, :string
    add_column :users, :public_email, :string
    add_column :users, :url, :string
    add_column :users, :institution, :string
    add_column :users, :location, :string
    add_column :users, :interests, :text
  end
end
