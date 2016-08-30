class VerifyEmail < ApplicationMailer

	#for development
	#default from: "webmess.dev@gmail.com"

	#for profuction
	default from: "verificationdonotreply@app4b048edc22f24a2e8f5429e525021387.mailgun.org"


	def send_verification(user)
		@user = user
		@email_validation_code = (0...8).map { (65 + rand(26)).chr}.join
		user.email_validation= @email_validation_code
		user.save
		mail(to: @user.email, subject: "Verify Your Account")
		
	end

end
