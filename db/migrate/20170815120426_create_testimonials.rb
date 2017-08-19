class CreateTestimonials < ActiveRecord::Migration[5.0]
  def change
    create_table :testimonials do |t|
      t.text :body
      t.string :avatar

      t.timestamps
    end
  end
end
