class CreateGalleries < ActiveRecord::Migration[5.0]
  def change
    create_table :galleries do |t|
      t.string :file
      t.string :show_at, limit: 50

      t.timestamps
    end
  end
end
