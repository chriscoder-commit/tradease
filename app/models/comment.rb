class Comment < ApplicationRecord
  #this is where the relations with other models are established
  belongs_to :listing
  belongs_to :user
end
