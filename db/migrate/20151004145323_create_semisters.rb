class CreateSemisters < ActiveRecord::Migration
  def change
    create_table :semisters do |t|
      t.integer :course_id
      t.string :semister_name
      t.string :year

      t.timestamps null: false
    end
  end
end
