class Testimonial < ApplicationRecord
	mount_uploader :avatar, ImageUploader
	after_destroy :delete_directory

	def delete_directory
		FileUtils.rm_rf(Rails.root.join('public','uploads', 'testimonial', 'avatar', self.id.to_s)) if self.avatar
	end
end
