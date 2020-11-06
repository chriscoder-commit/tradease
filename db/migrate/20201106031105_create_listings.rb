class CreateListings < ActiveRecord::Migration[6.0]
  def change
    create_table :listings do |t|
      t.string :name
      t.integer :price
      t.boolean :available
      t.text :description

      t.timestamps
    end
  end
end
