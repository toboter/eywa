class CreateProjects < ActiveRecord::Migration
  def self.up
    create_table :projects do |t|
      t.string :name
      t.string :shortcut
      t.timestamps
      t.userstamps
    end
  end

  def self.down
    drop_table :projects
  end
end
