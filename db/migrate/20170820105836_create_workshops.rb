class CreateWorkshops < ActiveRecord::Migration[5.0]
  def change
    create_table :workshops do |t|
      t.string :name
      t.string :email
      t.string :mobile
      t.string :workshop_type
      t.string :location
      t.string :state
      t.string :city
      t.string :subject
      t.text :message
      t.timestamps
    end
  end
end
