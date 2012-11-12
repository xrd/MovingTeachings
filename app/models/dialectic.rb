class Dialectic < ActiveRecord::Base
  belongs_to :user
  belongs_to :route
  scope :approved, where( [ "approved = ?", true ] )
  serialize :times
  serialize :days
  
  def as_json(options={})
    options[:except] ||= :user_id
    options[:include] ||= :route
    super( options )
  end
end
