class Membership < ActiveRecord::Base
  attr_accessible :project_id, :role_id, :user_id
  stampable

  belongs_to :project
  belongs_to :user

  validates_presence_of :user_id

  ROLES = {"admin" => 1 ,"member" => 2, "associate" => 3, "guest" =>4}
end
