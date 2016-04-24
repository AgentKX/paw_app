class AddInfoToAdopters < ActiveRecord::Migration
  def change
    add_column :adopters, :business_name, :string
    add_column :adopters, :street, :string
    add_column :adopters, :city, :string
    add_column :adopters, :state, :string
    add_column :adopters, :zip, :string
    add_column :adopters, :phone, :string
  end
end
