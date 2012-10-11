class AddFavorites < ActiveRecord::Migration
  def up
    create_table :favorites do |t|
      t.timestamps
      t.integer :dialectic_id, :user_id
    end
    add_column :dialectics, :favorited_count, :integer
  end

  def down
    drop_table :favorites
    remove_column :dialectics, :favorited_count
  end
end
