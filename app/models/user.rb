class User < Account
  attr_accessible :username, :email, :password, :password_confirmation, :fullname, :public_email, :url, :institution, :location, :interests

  has_many :fellowships, :dependent => :destroy
  has_many :organisations, :through => :fellowships

  attr_accessor :password
  before_save :prepare_password

  validates_format_of :email, :with => /^[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}$/i
  validates_presence_of :password, :on => :create
  validates_confirmation_of :password
  validates_length_of :password, :minimum => 4, :allow_blank => true

  # login can be either username or email address
  def self.authenticate(login, pass)
    user = find_by_username(login) || find_by_email(login)
    return user if user && user.password_hash == user.encrypt_password(pass)
  end

  def encrypt_password(pass)
    BCrypt::Engine.hash_secret(pass, password_salt)
  end

  def self.possible_fellows(organisation_fellows)
    where("id not in (?)", organisation_fellows)
  end
  
  private

  def prepare_password
    unless password.blank?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = encrypt_password(password)
    end
  end
end


