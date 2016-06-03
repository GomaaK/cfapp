class StaticPagesController < ApplicationController
  def index
  	@products = Product.limit(3)
  end

  def about
  end

  def contact
  end

	def thank_you
		@name = params[:name]
		@company = params[:company]
		@email = params[:email]
		@telephone = params[:telephone]
		@message = params[:message]
		ActionMailer::Base.mail(
			:from => @email,
 			:to => 'chrwimct@gmail.com',
 			:subject => "A new contact form message from #{@name}",
			:body => @message).deliver_now
	end
end
