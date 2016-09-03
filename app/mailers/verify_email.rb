class VerifyEmail < ApplicationMailer

	#for development
	#default from: "webmess.dev@gmail.com"

	#for production
	default from: "postmaster@webmess.ca"


	def send_verification(user)

		@default_password = (0...8).map { (65 + rand(26)).chr}.join
		
		user.password = @default_password
		user.password_confirmation = @default_password
		user.email_checked = false
		user.save!
		mail(:to => user.email, :subject => "Account Setup")
	end

	def send_password_forgot(user)
		
		@reset_password = (0...8).map { (65 + rand(26)).chr}.join
		
		
		user.password = @reset_password
		user.password_confirmation = @reset_password
		user.email_checked = false
		user.save!
		mail(:to => user.email, :subject => "Password Reset")

	end

	def send_profile_change(user)
	end


end
