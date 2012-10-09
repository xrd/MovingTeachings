class AddDialectic < ActiveRecord::Migration
  def up
    create_table :dialectics do |t|
      t.integer :route_id
      t.integer :user_id
      t.string :description
      t.string :offered_dates
      t.timestamps
    end
  end

  def down
    drop_table :dialectics
  end
end
