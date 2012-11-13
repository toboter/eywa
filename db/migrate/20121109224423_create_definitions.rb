class CreateDefinitions < ActiveRecord::Migration
  def self.up
    create_table :definitions do |t|
      t.string :name
      t.string :predicate
      t.string :content
      t.integer :project_id
      t.string :ancestry
      t.text :comment
      t.boolean :metaclass
      t.string :approved_since_version
      t.string :deprecated_since_version

      t.timestamps
      t.userstamps
    end
    add_index :definitions, :ancestry
  end

  def self.down
    drop_table :definitions
  end
end
