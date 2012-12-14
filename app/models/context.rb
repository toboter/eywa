class Context < ActiveRecord::Base
  attr_accessible :project_id, :definition_id, :version_id, :name, :properties
  stampable

  belongs_to :project
  belongs_to :definition
end


