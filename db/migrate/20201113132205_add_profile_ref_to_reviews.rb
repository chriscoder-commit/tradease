class AddProfileRefToReviews < ActiveRecord::Migration[6.0]
  def change
    add_reference :reviews, :profile, null: false, foreign_key: true
  end
end
