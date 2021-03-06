class Admin::TestimonialsController < ApplicationController
	before_action :authenticate_user!
	before_action :set_testimmonial, only: [:edit,:update,:destroy]
	def index
		@testimonials = Testimonial.all
	end

	def new
		@testimonial = Testimonial.new
	end

	def create
		@testimonial = Testimonial.new(testimonial_params)
		if @testimonial.save
			flash[:success] = "Testimonial saved successfully"
			redirect_to admin_testimonials_path
		else
			flash.now[:danger] = "Something wrong, try again"
			render :new
		end
	end

	def edit
	end

	def update
		if @testimonial.update_attributes(testimonial_params)
			flash[:success] = "Testimonial updated successfully"	
			redirect_to admin_testimonials_path
		else
			flash.now[:danger] = "Something wrong, try again"
			render :edit
		end
	end

	def destroy
		@testimonial.destroy
		flash[:success] = "Testimonial deleted successfully"
		redirect_to admin_testimonials_path
	end

	private

	def testimonial_params
		params.require(:testimonial).permit(:avatar, :body, :name)
	end

	def set_testimmonial
		@testimonial = Testimonial.find(params[:id])
	end
end