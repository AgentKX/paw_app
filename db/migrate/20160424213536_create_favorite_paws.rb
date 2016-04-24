class CreateFavoritePaws < ActiveRecord::Migration
  def change
    create_table :favorite_paws do |t|
      t.integer  "user_id"
      t.integer  "paw_id"
      t.string   "status"
      t.timestamps null: false
    end
  end
end
