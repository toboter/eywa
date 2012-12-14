class CreateContexts < ActiveRecord::Migration
  def self.up
    create_table :contexts do |t|
      t.integer :project_id
      t.integer :definition_id
      t.integer :version_id
      t.string :name
      t.hstore :properties
      t.timestamps
      t.userstamps
    end
  end

  def self.down
    drop_table :contexts
  end
end
