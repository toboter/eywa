class Organisation < Account
  attr_accessible :username, :email, :fullname, :public_email, :url, :institution, :location, :interests

  has_many :fellowships, :dependent => :destroy
  has_many :users, :through => :fellowships
end
