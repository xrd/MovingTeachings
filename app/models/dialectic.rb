class Dialectic < ActiveRecord::Base
  belongs_to :user
  belongs_to :route
  scope :approved, where( "approved = 1" )

  def as_json(options={})
    options[:except] ||= :user_id
    options[:include] ||= :route
    super( options )
  end
end
