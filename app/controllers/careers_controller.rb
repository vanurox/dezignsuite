class CareersController < ApplicationController

	def career
		@career = Career.new
	end

	def create
		@career = Career.new(career_params)
		if @career.save
			NotifyMailer.career_notify(@career).deliver_later
			redirect_to career_path
		else
			render :career
		end
	end

	private

	def career_params
		params.require(:career).permit(:name, :email, :mobile, :phone, :location, :state, :city, :subject, :message)
	end

end