class Membership < ActiveRecord::Base
  attr_accessible :project_id, :role, :account_id
  stampable

  belongs_to :project
  belongs_to :account

  ROLES = %w[admin member guest]

  validates_presence_of :account_id, :project_id
end
