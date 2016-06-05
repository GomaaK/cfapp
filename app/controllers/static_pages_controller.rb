class StaticPagesController < ApplicationController
  def index
  	@products = Product.limit(3)
  end

  def search
  end

  def search_results
  end

  def about
  end

  def contact
  end

  # Contact form submission email sent to me
	def thank_you
		@name = params[:name]
		@company = params[:company]
		@email = params[:email]
		@telephone = params[:telephone]
		@message = params[:message]
		ActionMailer::Base.mail(
			:from => @email,
 			:to => 'cwmct79@gmail.com',
 			:subject => "New Website Form Message",
			:body => [@name, @company, @email, @telephone, @message]).deliver_now
		UserMailer.contact_reply(@email, @name, @message).deliver_now
	end
end
