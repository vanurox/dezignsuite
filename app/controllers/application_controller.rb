class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  layout :set_layout
  def after_sign_in_path_for(resource)
  	admin_root_path
  end

  def set_layout
  	if devise_controller?
  		"devise"
  	else
  		"application"
  	end
  end
end
