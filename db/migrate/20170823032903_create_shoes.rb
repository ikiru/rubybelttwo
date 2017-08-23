class CreateShoes < ActiveRecord::Migration
  def change
    create_table :shoes do |t|
      t.string :product
      t.float :price
      t.references :buyer, index: true, foreign_key: true
      t.references :seller, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
