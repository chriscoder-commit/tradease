class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.float :stars
      t.text :body

      t.timestamps
    end
  end
end
