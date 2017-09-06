class Admin::StudentEnrollmentsController < ApplicationController
	before_action :authenticate_user!

	def index
		@students = StudentEnrollment.all
	end

	def show
		@student  = StudentEnrollment.find(params[:id])																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																
	end

	def destroy
		@student  = StudentEnrollment.find(params[:id])
		@student.destroy
		flash[:success] = "Record deleted successfully"
		redirect_to admin_student_enrollments_path
	end
end