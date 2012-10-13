class AddTimeAndDaysAndConstraintsToDialectic < ActiveRecord::Migration
  def change
    stuff = { minimum: :integer, maximum: :integer, days: :string, times: :string }
    stuff.keys.each do |k|
      add_column :dialectics, k, stuff[k]
    end
  end
end
