class AddAdopterIdToPaws < ActiveRecord::Migration
  def change
    add_column :paws, :adopter_id, :integer
  end
end
