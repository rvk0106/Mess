class CreateSubjects < ActiveRecord::Migration
  def change
    create_table :subjects do |t|
      t.string :subject_name
      t.integer :semister_id

      t.timestamps null: false
    end
  end
end
