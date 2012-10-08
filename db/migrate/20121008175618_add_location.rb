class AddLocation < ActiveRecord::Migration
  def up
    create_table :locations do |t|
      t.string :name
      t.integer :lat,
      :lng
      
      t.timestamps
    end

    remove_column :routes, :coordinates
    add_column :routes, :lat, :float
    add_column :routes, :lng, :float
  end

  def down
    drop_table :locations
    remove_column :routes,:lat
    remove_column :routes,:lng
    add_column :routes, :coordinates
  end
end
