class Admin::ContactsController < ApplicationController
	before_action :authenticate_user!	
	def index
		@contacts = Contact.all
	end

	def show
		@contact = Contact.find(params[:id])
	end

	def destroy
		@contact = Contact.find(params[:id])
		@contact.destroy
		redirect_to admin_contacts_path
	end
end