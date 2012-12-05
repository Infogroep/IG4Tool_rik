class User < ActiveRecord::Base
	# new columns need to be added here to be writable through mass assignment
	attr_accessible :username, :email, :password, :password_confirmation

	attr_accessor :password
	before_save :prepare_password

	validates_presence_of :username
	validates_uniqueness_of :username, :email, :allow_blank => true
	validates_format_of :username, :with => /^[-\w\._@]+$/i, :allow_blank => true, :message => "should only contain letters, numbers, or .-_@"
	validates_format_of :email, :with => /^[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}$/i
	validates_presence_of :password, :on => :create
	validates_confirmation_of :password
	validates_length_of :password, :minimum => 4, :allow_blank => true

  has_and_belongs_to_many :user_groups
	has_and_belongs_to_many :teams
	has_many :logs

	# login can be either username or email address
	def self.authenticate(login, pass)
		user = find_by_username(login) || find_by_email(login)
		return user if user && user.password_hash == user.encrypt_password(pass)
	end

	def encrypt_password(pass)
		BCrypt::Engine.hash_secret(pass, password_salt)
	end

  def access_allowed?(access_type)
    allowed = false
    user_groups.find_each do |group|
      allowed ||= group.allows_access?(access_type)
    end
    return allowed
  end

	private

	def prepare_password
		unless password.blank?
			self.password_salt = BCrypt::Engine.generate_salt
			self.password_hash = encrypt_password(password)
		end
  end

end
