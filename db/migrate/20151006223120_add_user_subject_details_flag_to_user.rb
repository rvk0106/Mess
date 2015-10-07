class AddUserSubjectDetailsFlagToUser < ActiveRecord::Migration
  def change
    add_column :users, :user_subject_details_flag, :boolean
  end
end
