class AddApprovedToDialectics < ActiveRecord::Migration
  def change
    add_column :dialectics, :approved, :boolean
  end
end
