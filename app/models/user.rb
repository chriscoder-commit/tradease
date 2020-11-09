class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_one :tradesman
  has_one :profile
  has_many :listings

  validates :username, presence: true

  def tradesman?
    !self.tradesman.nil?
  end 
end

