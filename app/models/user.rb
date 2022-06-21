class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :orders
  has_many :books
  has_many :user_coupons
  has_many :coupons, through: :user_coupons

  def admin?
    self.role == "admin"
  end
end