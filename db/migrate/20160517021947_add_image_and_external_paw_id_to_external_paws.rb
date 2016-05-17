class AddImageAndExternalPawIdToExternalPaws < ActiveRecord::Migration
  def change
    add_column :external_paws, :image, :string
    add_column :external_paws, :external_paw_id, :integer
  end
end
