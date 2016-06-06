class UserMailer < ApplicationMailer
	default from: "cwmct79@gmail.com"

# Contact form submission information email to me
	def contact_info(name, company, email, telephone, message)
		@name = name
		@company = company
  	@email = email
  	@telephone = telephone
  	@message = message
    mail(:to => "cwmct79@gmail.com",
        :subject => "Oasis Books Contact Form Message")
  end

	# Contact form submission email reply to sender
	def contact_reply(email, name, message)
  	@email = email
  	@name = name
  	@message = message
    mail(:to => email,
        :subject => "Thank You For Your Message")
  end
end
