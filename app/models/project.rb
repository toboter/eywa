class Project < ActiveRecord::Base
  attr_accessible :name, :shortcut, :memberships_attributes, :definitions_attributes
  stampable

  has_many :memberships, :dependent => :destroy
  has_many :users, :through => :memberships
  has_many :definitions

  accepts_nested_attributes_for :memberships, :reject_if => lambda { |a| a[:user_id].blank? }, :allow_destroy => true
  accepts_nested_attributes_for :definitions, :reject_if => lambda { |a| a[:name].blank? }, :allow_destroy => true
end
