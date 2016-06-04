class UserMailer < ApplicationMailer
	default from: "cwmct79@gmail.com"

	# Contact form submission email reply to sender
	def contact_reply(email, name, message)
  	@email = email
  	@name = name
  	@message = message
    mail(:to => email,
        :subject => "Thank You For Your Message")
  end
end
