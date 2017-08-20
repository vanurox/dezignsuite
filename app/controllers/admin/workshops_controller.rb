class Admin::WorkshopsController < ApplicationController
	before_action :authenticate_user!
	def index
		@workshops = Workshop.all
	end
end