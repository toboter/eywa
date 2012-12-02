class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :name
      t.text :comment
      t.string :range

      t.timestamps
    end
  end
end
