class Definition < ActiveRecord::Base
  attr_accessible :name, :predicate, :content, :comment, :metaclass, :project_id, :parent_id
  stampable
  has_ancestry

  belongs_to :project
end
