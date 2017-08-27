class Gallery < ApplicationRecord
	mount_uploader :file, ImageUploader
	after_destroy :delete_directory

	scope :gallery, -> { where(:show_at=> 'gallery') }
	scope :slides, -> { where(:show_at=> 'slider') }

	def delete_directory
		FileUtils.rm_rf(Rails.root.join('public','uploads', 'gallery', 'file', self.id.to_s)) if self.file
	end
end
