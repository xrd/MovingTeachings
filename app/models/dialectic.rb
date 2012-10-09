class Dialectic < ActiveRecord::Base
  belongs_to :user
  belongs_to :route

  def as_json(options={})
    super( :include => :route )
  end
end
