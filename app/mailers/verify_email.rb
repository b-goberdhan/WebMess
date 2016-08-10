class VerifyEmail < ApplicationMailer

	def send_verification(user)
		@user = user
		@email_validation_code = (0...8).map { (65 + rand(26)).chr}.join
		@user.assign_attributes(:email_validation => @email_validation_code)
		mail(to: @user.email, subject: "Verify Your Account")
	end

end
