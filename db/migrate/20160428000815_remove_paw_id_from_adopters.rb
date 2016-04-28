class RemovePawIdFromAdopters < ActiveRecord::Migration
  def change
    remove_column :adopters, :paw_id, :integer
  end
end
