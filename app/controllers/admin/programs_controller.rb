class Admin::ProgramsController < ApplicationController
	before_action :authenticate_user!
	def index
		@programs = Program.all
	end

	def show
		@program = Program.find(params[:id])
	end

	def destroy
		@program = Program.find(params[:id])
		@program.destroy
		flash[:success] = "Program deleted successfully"
		redirect_to admin_programs_path
	end
end