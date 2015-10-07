class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :course_name
      t.integer :university_id

      t.timestamps null: false
    end
  end
end
