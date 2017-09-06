class Admin::WorkshopsController < ApplicationController
	before_action :authenticate_user!
	def index
		@workshops = Workshop.all
	end

	def show
		@workshop = Workshop.find(params[:id])
	end

	def destroy
		@workshop = Workshop.find(params[:id])
		@workshop.destroy
		flash[:success] = "Workshop deleted successfully"
		redirect_to admin_workshops_path
	end
end