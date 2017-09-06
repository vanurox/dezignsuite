class ProgramsController < ApplicationController

	def program
	end

	def inhouse_program
		@program = Program.new
		session[:last_page] = inhouse_training_program_path
	end

	def job_program
		@program = Program.new
		session[:last_page] = joboriented_training_program_path
	end

	def corporate_program
		@program = Program.new
		session[:last_page] = corporate_training_program_path
	end

	def create
		@program = Program.new(program_params)
		if @program.save
			NotifyMailer.program_notify(@program).deliver_now
			flash[:success] = "Your form is submitted successfully. We will contact you soon."
			redirect_to session[:last_page]
		else
			render "#{session[:last_page]}"
		end
	end

	private

	def program_params
		params.require(:program).permit(:name, :email,:mobile, :program_type, :location,:state,:city,:subject,:message)
	end
end