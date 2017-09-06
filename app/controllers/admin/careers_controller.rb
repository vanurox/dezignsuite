class Admin::CareersController < ApplicationController
	before_action :authenticate_user!

	def index
		@careers = Career.all
	end

	def show
		@career = Career.find(params[:id])
	end

	def destroy
		@career = Career.find(params[:id])
		@career.destroy
		flash[:success] = "Career deleted successfully"
		redirect_to admin_careers_path
	end

end