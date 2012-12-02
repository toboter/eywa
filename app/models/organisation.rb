class Organisation < Account
  attr_accessible :username, :email, :fullname, :public_email, :url, :institution, :location, :interests

  has_many :fellowships, :dependent => :destroy
  has_many :users, :through => :fellowships

  after_create :add_admin

  def add_admin
  	Fellowship.create :user_id => creator_attribute, :organisation_id => self.id, :role => 'admin'
  end
end
