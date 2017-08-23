class CreateShoes < ActiveRecord::Migration
  def change
    create_table :shoes do |t|
      t.string :product
      t.float :price
      t.references :buyer, index: true
      t.references :seller, index: true 

      t.timestamps null: false
    end
  end
end
