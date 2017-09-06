class WorkshopsController < ApplicationController

	def workshop
	end

	def college_workshop
		@workshop = Workshop.new
		@last_page = college_workshop_path
	end

	def corporate_workshop
		@workshop = Workshop.new
		session[:last_page] = corporate_workshop_path
	end

	def school_workshop
		@workshop = Workshop.new
		session[:last_page] = school_workshop_path
	end

	def create
		@workshop = Workshop.new(workshop_params)
		if @workshop.save
			NotifyMailer.workshop_notify(@workshop).deliver_now
			flash[:success] = "Your form is submitted successfully. We will contact you soon."
			redirect_to session[:last_page]
		else
			render "#{session[:last_page]}"
		end
	end

	private

	def workshop_params
		params.require(:workshop).permit(:name,:email,:mobile,:workshop_type,:location,:state,:city,:subject,:message)
	end
end