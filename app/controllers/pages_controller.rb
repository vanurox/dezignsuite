class PagesController < ApplicationController
	
	def home
		@contact = Contact.new
		@slides = Gallery.slides.where(status: 1)
		@galleries = Gallery.gallery.where(status: 1)
		@testimonials = Testimonial.order('updated_at desc').limit(6)
	end

	def about_us
	end

	def blog
	end

end
