class CreateExternalPaws < ActiveRecord::Migration
  def change
    create_table :external_paws do |t|
      t.integer :user_id
      t.string :name
      t.string :breed
      t.string :description

      t.timestamps null: false
    end
  end
end
