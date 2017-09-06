class ContactsController < ApplicationController
	
	def contact
		@contact = Contact.new
	end

	def create
		@contact = Contact.new(contact_params)
		if @contact.save
			NotifyMailer.notify(@contact).deliver_later
			flash[:success] = "Your form is submitted successfully. We will contact you soon."
			redirect_to contact_path
		else
			render :contact
		end
	end

	private

	def contact_params
		params.require(:contact).permit(:name,:email,:mobile,:phone,:message)
	end
end