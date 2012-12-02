class Fellowship < ActiveRecord::Base
  attr_accessible :organisation_id, :user_id, :role
  stampable

  belongs_to :user
  belongs_to :organisation

  validates_presence_of :user_id, :organisation_id, :role
end