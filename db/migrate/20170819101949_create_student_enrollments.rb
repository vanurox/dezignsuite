class CreateStudentEnrollments < ActiveRecord::Migration[5.0]
  def change
    create_table :student_enrollments do |t|
    	t.string :name, limit: 100
    	t.string :email, limit: 100
    	t.string :mobile, limit: 100
    	t.string :year, limit: 20
    	t.string :course, limit: 50
    	t.string :state, limit: 50
    	t.integer :postal_code
    	t.string :preferred_center,limit: 50
    	t.string :college
    	t.string :refer_by_name, limit: 50
    	t.string :refer_by_college
    	t.string :refer_by_number
    	t.integer :amount
      	t.timestamps
    end
  end
end
