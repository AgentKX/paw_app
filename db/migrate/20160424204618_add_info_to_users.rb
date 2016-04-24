class AddInfoToUsers < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :street, :string
    add_column :users, :city, :string
    add_column :users, :state, :string
    add_column :users, :zip, :string
    add_column :users, :phone, :string
    add_column :users, :gender, :string
    add_column :users, :has_yard, :string
    add_column :users, :has_kids, :string
    add_column :users, :employed, :string
    add_column :users, :retired, :string
  end
end
