class Tradesman < ApplicationRecord
  belongs_to :user
  has_one_attached :certification

  def tradesman?
    self.tradesman.nil?
  end 
end

