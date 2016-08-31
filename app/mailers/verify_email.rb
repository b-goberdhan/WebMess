class VerifyEmail < ApplicationMailer

	#for development
	#default from: "webmess.dev@gmail.com"

	#for production
	default from: "postmaster@webmess.ca"


	def send_verification(user)
		@user = user
		@email_validation_code = (0...8).map { (65 + rand(26)).chr}.join
		user.email_validation= @email_validation_code
		user.save
		mail(to: @user.email, subject: "Verify Your Account")
		
	end

end
