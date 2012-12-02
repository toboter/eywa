class Membership < ActiveRecord::Base
  attr_accessible :project_id, :role_id, :account_id
  stampable

  belongs_to :project
  belongs_to :account
  belongs_to :role

  validates_presence_of :account_id, :project_id
end
