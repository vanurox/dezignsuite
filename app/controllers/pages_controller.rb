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

	def services
	end

	def enterprise_services
	end

	def testing_services
	end

	def digital_marketing_services
	end

	def training_services
	end

	def recruitment_services
	end

	def online_reputation_services
	end

	def seo_services
	end

	def smo_services
	end

	def pay_per_click_services
	end

	def courses
	end

	def c_course
	end

	def cplus_course
	end

	def bigdata_course
	end

	def business_analyst_course
	end

	def java_course
	end

	def python_course
	end

	def php_course
	end

	def ios_course
	end

	def android_course
	end

	def tally_course
	end

	def networking_course
	end

	def oracle_course
	end

	def software_testing_course
	end

	def web_designing_course
	end

	def cloud_computing_course
	end

end
