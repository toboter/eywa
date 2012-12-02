class Description < ActiveRecord::Base
  attr_accessible :content, :definition_id, :predicate
  stampable

  belongs_to :definition
end
