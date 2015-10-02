class AddMobileToUsers < ActiveRecord::Migration
  def change
    add_column :users, :mobile, :string
	add_column :users, :name, :string
	add_column :users, :location, :string
  end
end
