class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.string :name
      t.text :description
      t.string :place_of_business
      t.text :about_me
      t.integer :skills

      t.timestamps
    end
  end
end
