require 'Instamojo-rb'
class StudentEnrollmentsController < ApplicationController

	def new
	end

	def create
		api = Instamojo::API.new("96530e29cca09e36297a8b49720b35c4", "ad08e5ea16029051bfce0c62d40ed2ef", "https://test.instamojo.com/api/1.1/")
		client = api.client
		new_product_params = {amount: params[:amount], purpose: 'API product 3', currency: 'INR', redirect_url: "http://localhost:3000", buyer_name: params[:name],email: params[:email],phone: params[:mobile], send_email: true,send_sms: true}
		new_link = client.payment_request(new_product_params)
		location = new_link.longurl
		redirect_to location
	end
end