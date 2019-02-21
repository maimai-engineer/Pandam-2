 class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  acts_as_paranoid
  attachment :image
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum user_is_deleted: { active: 0, dead: 1 }

  has_many :shipments, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :carts, dependent: :destroy
  has_many :items, through: :carts

end
