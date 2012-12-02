class AddMorefieldsToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :basic, :boolean
    add_column :projects, :xmlns_url, :string
    add_column :projects, :project_url, :string
  end
end
