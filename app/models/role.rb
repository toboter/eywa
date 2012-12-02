class Role < ActiveRecord::Base
  attr_accessible :comment, :name, :range

  scope :membership, where(:range => 'membership')
  scope :organisation, where(:range => 'organisation')
end
