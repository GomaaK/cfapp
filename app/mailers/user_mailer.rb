class UserMailer < ApplicationMailer
	default from: "cwmct79@gmail.com"

# Welcome message to new user
  def welcome(user)
    @appname = "Oasis Books"
    mail( :to => user.email,
          :subject => "Welcome to #{@appname}!")
  end

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

  # Order and payment confirmation email to customer
  def order_placed(name, email)
    @name = name
    @email = email
    mail( :to => email,
          :subject => "Your Order from Oasis Books")
  end
end
