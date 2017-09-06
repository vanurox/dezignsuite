class Admin::GalleriesController < ApplicationController
	before_action :authenticate_user!
	before_action :set_gallery, except: [:index,:new,:create]
	def index
		@galleries = Gallery.all
	end

	def new
		@gallery = Gallery.new
	end

	def create
		@gallery = Gallery.new(gallery_params)
		if @gallery.save
			flash[:success] = "Record saved successfully"
			redirect_to admin_galleries_path
		else
			flash.now[:danger] = "Something wrong, try again"
			render :new
		end
	end

	def edit
	end

	def update
		if @gallery.update_attributes(gallery_params)
			flash[:success] = "Record saved successfully"
			redirect_to admin_galleries_path
		else
			flash.now[:danger] = "Something wrong, try again"
			render :edit
		end
	end

	def publish
		@gallery.update_attributes(status: true)
		flash[:success] = "Record published successfully"
		redirect_to admin_galleries_path
	end

	def unpublish
		@gallery.update_attributes(status: false)
		flash[:success] = "Record unpublished successfully"
		redirect_to admin_galleries_path
	end

	def destroy
		@gallery.destroy
		flash[:success] = "Record deleted successfully"
		redirect_to admin_galleries_path
	end

	private

	def gallery_params
		params.require(:gallery).permit(:file, :show_at)
	end

	def set_gallery
		@gallery = Gallery.find(params[:id])
	end
end