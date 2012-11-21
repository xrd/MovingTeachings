class AddPrerequisite < ActiveRecord::Migration
  def up
    create_table :prerequisites do |t|
      t.timestamps
      t.integer :dialectic_id
      t.string :comment
      t.string :link
      t.float :lat, :lng
      t.string :ptype
    end
  end

  def down
    drop_table :prerequisites
  end
end
