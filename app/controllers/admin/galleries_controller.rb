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
			redirect_to admin_galleries_path
		else
			render :new
		end
	end

	def edit
	end

	def update
		if @gallery.update_attributes(gallery_params)
			redirect_to admin_galleries_path
		else
			render :edit
		end
	end

	def publish
		@gallery.update_attributes(status: true)
		redirect_to admin_galleries_path
	end

	def unpublish
		@gallery.update_attributes(status: false)
		redirect_to admin_galleries_path
	end

	def destroy
		@gallery.destroy
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