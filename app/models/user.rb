class User < ActiveRecord::Base
	has_secure_password

	#attr_accessor :password,:password_confirmation
	EMAIL_REGEX = /\A[A-Z0-9._%+-]+@ucalgary+\.ca\z/i
	
	validates :username, :presence => true, :uniqueness => true, :length => { :in => 3..20 }
	validates :faculty, :presence => true
	validates :major, :presence => true
  	validates :email, :presence => true, :uniqueness => true , :format => EMAIL_REGEX
  	validates :password, :confirmation => true   #password_confirmation attr
  	validates :password_confirmation, :presence => true

end
