class AddApprovalAndRequestedToLocation < ActiveRecord::Migration
  def change
    add_column :locations, :approved, :boolean
    add_column :locations, :requested, :integer
    add_column :locations, :canonical_name, :string
  end
end
