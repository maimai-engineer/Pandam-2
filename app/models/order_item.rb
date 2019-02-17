class OrderItem < ApplicationRecord
  enum cancell_status: { normal: 0, user_cancell: 1 }

  belongs_to :item
  belongs_to :order
  belongs_to :user through: :order
end
