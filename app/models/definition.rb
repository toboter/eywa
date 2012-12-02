class Definition < ActiveRecord::Base
  attr_accessible :name, :descriptions_attributes, :comment, :metaclass, :project_id, :parent_id, :approved_since_version, :deprecated_since_version
  stampable
  has_ancestry

  belongs_to :project
  has_many :descriptions, :dependent => :destroy

  accepts_nested_attributes_for :descriptions, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true

  def definition_name
    "#{project.shortcut}:#{name}"
  end

  def self.possible_parents(root, subtree)    # and any targets?
    possible_parents = subtree_of(roots.where('name = ?', root))
    if subtree.present?
      possible_parents = possible_parents.where("id not in (?)", subtree)
    end
    possible_parents
  end

end
