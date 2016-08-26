class User < ActiveRecord::Base
	has_secure_password

	#attr_accessor :password,:password_confirmation
	EMAIL_REGEX = /\A[A-Z0-9._%+-]+@ucalgary+\.ca\z/i
	
	validates :username, :presence => true, :uniqueness => true, :length => { :in => 3..20 }
	validates :faculty, :presence => true
	validates :major, :presence => true
  	validates :email, :presence => true, :uniqueness => true , :format => EMAIL_REGEX
  	validates :password, :confirmation => true   #password_confirmation attr
  	validates :password_confirmation, :presence => true, :if => Proc.new { |user| user.new_record? }




=begin
def self.authenticate(username_email = "", login_password = "")
	if EMAIL_REGEX.match(username_email)
		user = User.find_by_email(username_email)
	else
		user = User.find_by_username(username_email)
	end

	if user && User.match_password(login_password)
		return user 
	else
		return false
	end

def match_password(login_password="")
  encrypted_password == BCrypt::Engine.hash_secret(login_password, salt)
end 
=end
end
