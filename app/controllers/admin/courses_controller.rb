class Admin::CoursesController < ApplicationController
	before_action :authenticate_user!
	before_action :set_course, only: [:edit, :update, :destroy]

	def index
		@courses = Course.order("updated_at  desc")
	end

	def new
		@course = Course.new
	end

	def create
		@course = Course.new(course_params)
		if @course.save
			flash[:success] = "Course successfully added"
			redirect_to admin_courses_path
		else
			flash.now[:danger] = "Something wrong, Try again"
			render :new
		end
	end

	def edit
	end

	def update
		if @course.update_attributes(course_params)
			flash[:success] = "Course successfully updated"
			redirect_to admin_courses_path
		else
			flash.now[:danger] = "Something wrong, Try again"
			render :edit
		end
	end

	def destroy
		@course.destroy
		flash[:success] = "Course successfully deleted"
		redirect_to admin_courses_path
	end

	private

	def course_params
		params.require(:course).permit(:name)
	end

	def set_course
		@course = Course.find(params[:id])
	end

end
