class AddNameToTestimonial < ActiveRecord::Migration[5.0]
  def change
    add_column :testimonials, :name, :string
  end
end
