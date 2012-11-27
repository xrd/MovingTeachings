class AddNameToPrereq < ActiveRecord::Migration
  def change
    add_column :prerequisites, :name, :string
    Prerequisite.all.each do |p|
      p.update_attribute :name, p.comment
      p.update_attribute :comment, nil
    end
  end
end
