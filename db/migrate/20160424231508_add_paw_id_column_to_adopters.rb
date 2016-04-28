class AddPawIdColumnToAdopters < ActiveRecord::Migration
  def change
    add_column :adopters, :paw_id, :integer
  end
end
