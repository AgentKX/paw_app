class CreatePaws < ActiveRecord::Migration
  def change
    create_table :paws do |t|
      t.string :name
      t.string :image
      t.string :gender
      t.string :breed
      t.string :weight
      t.string :color
      t.string :age
      t.string :description
      t.string :special_needs
      t.string :energy_level
      t.string :needs_yard
      t.string :kids_ok
      t.string :fees
      t.string :location

      t.timestamps null: false
    end
  end
end
