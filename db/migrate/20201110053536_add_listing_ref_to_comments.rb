class AddListingRefToComments < ActiveRecord::Migration[6.0]
  def change
    add_reference :comments, :listing, null: false, foreign_key: true
  end
end
