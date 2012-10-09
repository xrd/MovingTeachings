class AddFullDescriptionToDialectic < ActiveRecord::Migration
  def change
    rename_column :dialectics, :description, :title
    add_column :dialectics, :description, :text
  end
end
