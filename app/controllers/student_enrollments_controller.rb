require 'Instamojo-rb'
class StudentEnrollmentsController < ApplicationController

	def new
		@student_enrollment = StudentEnrollment.new
	end

	def create
		@student_enrollment = StudentEnrollment.new(student_params)
		if @student_enrollment.save
			@api = Instamojo::API.new("053431c72f20a1084731a0317e01c347", "cc85f91e2ed732ee6d257f542da36a26")
			client = @api.client
			new_product_params = {amount: student_params[:amount].to_i, purpose: 'Student Enrollment payment', currency: 'INR', redirect_url: "http://dezignsuitemohali.com/student_enrollments/#{@student_enrollment.id}/payment", buyer_name: student_params[:name],email: student_params[:email],phone: student_params[:mobile], send_email: false,send_sms: false}
			new_link = client.payment_request(new_product_params)
			location = new_link.longurl
			redirect_to location
		else
			render :new
		end
	end

	def payment
		@api = Instamojo::API.new("053431c72f20a1084731a0317e01c347", "cc85f91e2ed732ee6d257f542da36a26")
		@response = @api.client.payment_request_status(params[:payment_request_id])
		@fees = 3 + (@response.amount.to_f * 0.02)
	end

	private

	def student_params
		params.require(:student_enrollment).permit(:name,:email,:mobile,:year,:course,:state,:postal_code,:preferred_center,:college,:refer_by_name,:refer_by_college,:refer_by_number,:amount)
	end 
end