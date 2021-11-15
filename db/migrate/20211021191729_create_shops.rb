class CreateShops < ActiveRecord::Migration[6.1]
  def change
    create_table :shops do |t|
      t.string :image
      t.integer :price
      t.integer :ratings

      t.timestamps
    end
  end
end
