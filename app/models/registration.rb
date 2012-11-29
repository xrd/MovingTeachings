class Registration < ActiveRecord::Base
  belongs_to :user
  belongs_to :dialectic
  validates_uniqueness_of :user_id, :dialectic_id
end
