class AddFieldsToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :slug, :string
    add_column :projects, :description, :text
    add_column :projects, :owner_id, :integer

    add_index :projects, :slug
  end
end
