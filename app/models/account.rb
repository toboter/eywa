class Account < ActiveRecord::Base
  extend FriendlyId
  friendly_id :username

  model_stamper

  has_many :memberships, :dependent => :destroy
  has_many :projects, :through => :memberships
  has_many :own_projects, :class_name => "Project", :foreign_key => "owner_id", :dependent => :destroy

  validates_presence_of :username
  validates_uniqueness_of :username, :email, :allow_blank => true
  validates_format_of :username, :with => /^[-\w\_]+$/i, :allow_blank => true, :message => "should only contain letters, numbers, or -_"

  scope :users, where(:type => 'User')
  scope :organisations, where(:type => 'Organisation')

  # Die folgende Filtermethode macht mir Schwierigkeiten, da wenn sie auf bereits bestehende Member
  # angewendet wird, diese logischerweise auch nicht mehr angezeigt werden.
  def self.available_as_member(members, owner)
    if members.present?
      where('id != ?', owner) # where('id not in (?) AND id != ?', members, owner) 
    else
      where('id != ?', owner)
    end
  end

end
