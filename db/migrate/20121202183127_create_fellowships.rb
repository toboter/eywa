class CreateFellowships < ActiveRecord::Migration
  def self.up
    create_table :fellowships do |t|
      t.integer :organisation_id
      t.integer :user_id
      t.string :role
      t.timestamps
      t.userstamps
    end
  end

  def self.down
    drop_table :fellowships
  end
end
