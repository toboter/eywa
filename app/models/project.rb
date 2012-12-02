class Project < ActiveRecord::Base
  extend FriendlyId
  friendly_id :shortcut, use: :slugged

  attr_accessible :name, :shortcut, :memberships_attributes, :slug, :description, :owner_id
  stampable

  after_create :create_definition_skeleton

  has_many :memberships, :dependent => :destroy
  has_many :accounts, :through => :memberships # the members without the owner?
  has_many :definitions
  belongs_to :owner, :class_name => "Account" # the owner

  
  validates_uniqueness_of :shortcut, :name

  accepts_nested_attributes_for :memberships, :reject_if => lambda { |a| a[:account_id].blank? }, :allow_destroy => true


  def create_definition_skeleton
    Definition.create :name => "Thing", :project_id => self.id, :metaclass => true, 
      :approved_since_version => "obligatory", :deprecated_since_version => "never"
    Definition.create :name => "topObjectProperty", :project_id => self.id, :metaclass => true, 
      :approved_since_version => "obligatory", :deprecated_since_version => "never"


    # Hier werden die Basisschemata hinzugefügt, die durch ein anderes Projekt (base) definitiert werden. Über forks forkable!
    # :creator => current_user, forkable_id => basexyz, forkable_type => basexyz, forked_to => self.id, :undestroyable => true
    # base/rdfs => rdfs:range, base/rdf => rdf:type, base/owl => owl:inverseOf, base/cidoc => cidoc:P45_consists_of, 
    # base/layout => layout:has_text_field .. 20 50, layout:has_position .. left, base/vocabularies/ x y z
    # BASICPROPERTIES = %w[rdfs:domain rdfs:range rdfs:seeAlso] ..
    # BASICCLASSES = %w[text_field text_area image vocabulary]
  end

  def shortcut_name
    "#{name} (#{shortcut})"
  end
end
