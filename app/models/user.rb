class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_one :tradesman
  has_one :profile
  has_many :listings
  has_many :comments
  has_many :reviews

  validates :email, uniqueness: true
  validates :username, presence: true, uniqueness: true, length: { in: 5..15 }

  def tradesman?
    !self.tradesman.nil?
  end 
end

