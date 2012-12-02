class CreateDescriptions < ActiveRecord::Migration
  def change
    create_table :descriptions do |t|
      t.integer :definition_id
      t.string :predicate
      t.string :content

      t.timestamps
      t.userstamps
    end
  end
end
