class AddRegistration < ActiveRecord::Migration
  def up
    create_table :registrations do |t|
      t.timestamps
      t.integer :user_id
      t.integer :dialectic_id
    end
  end

  def down
    drop_table :registrations
  end
end
